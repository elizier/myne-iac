# resource "aws_route53_record" "myne_front" {
#   zone_id = data.terraform_remote_state.zone.outputs.public_zone_id
#   name    = ""
#   type    = "A"

#   alias {
#     name                   = data.terraform_remote_state.cdn.outputs._domain_name
#     zone_id                = data.terraform_remote_state.cdn.outputs._hosted_zone_id
#     evaluate_target_health = false
#   }
# }