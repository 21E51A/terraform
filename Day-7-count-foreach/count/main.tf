variable "env" {
  type = list(string)
  default = [ "ankith", "surya" ]
}

resource "aws_instance" "name" {
  ami="ami-07860a2d7eb515d9a"
  instance_type = "t3.micro"
  count = length(var.env)
  tags = {
    Name = var.env[count.index]
  }
}