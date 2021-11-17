output "postgres_sec_group_id" {
  value = aws_security_group.postgres.id
}

output "ec2_sec_group_id" {
  value = aws_security_group.ec2.id
}

output "public_sec_group_id" {
  value = aws_security_group.alb.id
}