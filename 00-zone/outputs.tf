output "public_zone_id" {
  value = aws_route53_zone.dns.zone_id
}

output "public_certificate_arn" {
  value = aws_acm_certificate.cert.arn
}