# resource "aws_route53_record" "videos_myne_front" {
#   zone_id = data.terraform_remote_state.zone.outputs.public_zone_id
#   name    = "videos"
#   type    = "A"

#   alias {
#     name                   = data.terraform_remote_state.cdn.outputs.videos_domain_name
#     zone_id                = data.terraform_remote_state.cdn.outputs.videos_hosted_zone_id
#     evaluate_target_health = false
#   }
# }

resource "aws_route53_record" "videos_myne_front" {
   zone_id = data.terraform_remote_state.zone.outputs.public_zone_id
   name    = ""
   type    = "A"

   alias {
     name                   = data.terraform_remote_state.cdn.outputs.videos_domain_name
     zone_id                = data.terraform_remote_state.cdn.outputs.videos_hosted_zone_id
     evaluate_target_health = false
   }
 }