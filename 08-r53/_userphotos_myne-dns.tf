# resource "aws_route53_record" "userphotos_myne_front" {
#   zone_id = data.terraform_remote_state.zone.outputs.public_zone_id
#   name    = "userphotos"
#   type    = "A"

#   alias {
#     name                   = data.terraform_remote_state.cdn.outputs.userphotos_domain_name
#     zone_id                = data.terraform_remote_state.cdn.outputs.userphotos_hosted_zone_id
#     evaluate_target_health = false
#   }
# }

 resource "aws_route53_record" "userphotos_myne_front" {
   zone_id = data.terraform_remote_state.zone.outputs.public_zone_id
   name    = "userphotos"
   type    = "A"

   alias {
     name                   = data.terraform_remote_state.cdn.outputs.userphotos_domain_name
     zone_id                = data.terraform_remote_state.cdn.outputs.userphotos_hosted_zone_id
     evaluate_target_health = false
   }
 }