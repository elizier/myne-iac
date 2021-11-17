output "instance_ids" {
  value = aws_instance.server-myne.*.id
}
