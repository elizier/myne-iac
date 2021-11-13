resource "aws_acm_certificate" "cert" {
  domain_name       = "*.${local.zones[terraform.workspace]}"
  validation_method = "DNS"
  tags              = local.acm_certificate_tags
  subject_alternative_names = ["*.${local.zones[terraform.workspace]}"]
  lifecycle {
    create_before_destroy = true
    ignore_changes        = [subject_alternative_names]
  }
}

resource "aws_route53_record" "cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.cert.domain_validation_options: dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }
  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = aws_route53_zone.dns.zone_id
}

resource "aws_acm_certificate_validation" "cert" {
  certificate_arn         = aws_acm_certificate.cert.arn
  validation_record_fqdns = [for record in aws_route53_record.cert_validation: record.fqdn]
}