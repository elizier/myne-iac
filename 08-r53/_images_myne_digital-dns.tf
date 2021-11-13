# resource "aws_route53_record" "images_myne_front" {
#   zone_id = data.terraform_remote_state.zone.outputs.public_zone_id
#   name    = "images"
#   type    = "A"

#   alias {
#     name                   = data.terraform_remote_state.cdn.outputs.images_domain_name
#     zone_id                = data.terraform_remote_state.cdn.outputs.images_hosted_zone_id
#     evaluate_target_health = false
#   }
# }