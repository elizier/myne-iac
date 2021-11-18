resource "aws_route53_record" "api_ipv4" {
  zone_id = data.terraform_remote_state.zone.outputs.public_zone_id
  name    = "api"
  type    = "A"

  alias {
    evaluate_target_health = true
    name                   = data.terraform_remote_state.alb.outputs.lb_dns_name
    zone_id                = data.terraform_remote_state.alb.outputs.lb_zone_id
  }
}

resource "aws_route53_record" "api_ipv6" {
  zone_id = data.terraform_remote_state.zone.outputs.public_zone_id
  name    = "api"
  type    = "AAAA"

  alias {
    evaluate_target_health = true
    name                   = data.terraform_remote_state.alb.outputs.lb_dns_name
    zone_id                = data.terraform_remote_state.alb.outputs.lb_zone_id
  }
}
