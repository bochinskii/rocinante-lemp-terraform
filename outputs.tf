output "rocinante_public_ip" {
  value = aws_instance.rocinante.public_ip
}

output "rocinante_public_dns" {
  value = aws_instance.rocinante.public_dns
}
