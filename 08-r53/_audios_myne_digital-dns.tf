resource "aws_route53_record" "audios_myne_front" {
  zone_id = data.terraform_remote_state.zone.outputs.public_zone_id
  name    = "audios"
  type    = "A"

  alias {
    name                   = data.terraform_remote_state.cdn.outputs.audios_domain_name
    zone_id                = data.terraform_remote_state.cdn.outputs.audios_hosted_zone_id
    evaluate_target_health = false
  }
}