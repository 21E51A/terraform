resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
}

resource "aws_subnet" "subnet_1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_1_cidr
  availability_zone = var.az1
}

resource "aws_subnet" "subnet_2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_2_cidr
  availability_zone = var.az2
}
