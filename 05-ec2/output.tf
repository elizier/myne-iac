output "instance_ids" {
  value = aws_instance.server-myne.*.id
}

output "instance_ips" {
  value = aws_instance.server-myne.*.private_ip
}

output "instance_public_ips" {
  value = aws_instance.server-myne.*.public_ip
}
