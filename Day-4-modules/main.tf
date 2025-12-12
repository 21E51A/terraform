resource "aws_instance" "name111" { 
    instance_type = var.type
     ami = var.ami_id
    
}
