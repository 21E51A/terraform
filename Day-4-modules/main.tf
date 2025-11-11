resource "aws_instance" "name1" { 
    instance_type = var.type
     ami = var.ami_id
    
}