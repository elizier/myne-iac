# resource "aws_route53_record" "files_myne_front" {
#   zone_id = data.terraform_remote_state.zone.outputs.public_zone_id
#   name    = "files"
#   type    = "A"

#   alias {
#     name                   = data.terraform_remote_state.cdn.outputs.files_domain_name
#     zone_id                = data.terraform_remote_state.cdn.outputs.files_hosted_zone_id
#     evaluate_target_health = false
#   }
# }
resource "aws_route53_record" "files_myne_front" {
   zone_id = data.terraform_remote_state.zone.outputs.public_zone_id
   name    = "files"
   type    = "A"

   alias {
     name                   = data.terraform_remote_state.cdn.outputs.files_domain_name
     zone_id                = data.terraform_remote_state.cdn.outputs.files_hosted_zone_id
     evaluate_target_health = false
   }
 }