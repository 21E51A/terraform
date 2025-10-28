output "publicIP" {
  value = aws_instance.name.private_ip
}
output "AZ" {
  value = aws_instance.name.availability_zone
}