resource "aws_instance" "name" {
  ami = "ami-080c353f4798a202f"
  instance_type = "t3.micro"
  tags = {
    Name="Ankith"
  }

  /* lifecycle {
    create_before_destroy = true
  } */

  /* lifecycle {
    ignore_changes = [ tags, ]
  } */

  /* lifecycle {
    prevent_destroy = true
  } */
}