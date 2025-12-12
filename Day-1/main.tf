resource "aws_instance" "name" {
    ami="ami-080c353f4798a202f"
    instance_type="t2.micro"
  
}
resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "AKASH"
    }
    
}
resource "aws_subnet" "name" {
    vpc_id = aws_vpc.name.id
    cidr_block = "10.0.0.0/24"
    tags = {
      Name = "new_subnet"
    }
}
