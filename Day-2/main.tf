#VPC
resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name="Akash"
    }
}

#subnet
resource "aws_subnet" "name" {
    vpc_id = aws_vpc.name.id
    cidr_block = "10.0.0.0/24"
    map_public_ip_on_launch = true 
    tags = {
      Name = "new-subnet"
    }
}
#IG
resource "aws_internet_gateway" "name" {
     vpc_id = aws_vpc.name.id
     tags = {
       Name="IG"
     }
}

#RT
resource "aws_route_table" "name" {
  vpc_id = aws_vpc.name.id        # ✅ Use VPC ID, not IGW ID

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.name.id   # ✅ Correct for default route
  }

  tags = {
    Name = "RT"
  }
}


#rt_assocation
resource "aws_route_table_association" "name" {
    subnet_id = aws_subnet.name.id
    route_table_id = aws_route_table.name.id
}
#sg
resource "aws_security_group" "name" {
      name        = "web-sg"
  description = "Allow SSH and HTTP access"
  vpc_id      = aws_vpc.name.id

  # Inbound rules
  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-security-group"
  }
}


#instance
resource "aws_instance" "name" {
    subnet_id = aws_subnet.name.id
    ami = "ami-0bdd88bd06d16ba03"
    instance_type = "t3.micro"
    key_name = "mynewkeypair" 
    vpc_security_group_ids = [ aws_security_group.name.id ]
    tags = {
      Name= "ec2"
    }

}

resource "aws_s3_bucket" "name" {
  bucket = "3-11-2025-new-bucket"
}