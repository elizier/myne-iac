resource "aws_route53_zone" "dns" {
  name = "${local.zones[terraform.workspace]}"
  tags = local.route53_zone_tags
}