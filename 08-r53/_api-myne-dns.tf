# resource "aws_route53_record" "api-myne" {
#   zone_id = aws_route53_zone.myneservices.zone_id
#   name    = "api"
#   type    = "A"

#   alias {
#     name                   = aws_alb.api_myne_alb.dns_name
#     zone_id                = aws_alb.api_myne_alb.zone_id
#     evaluate_target_health = true
#   }
# }

resource "aws_route53_record" "api_myne_front" {
   zone_id = data.terraform_remote_state.zone.outputs.public_zone_id
   name    = ""
   type    = "A"

   alias {
     name                   = data.terraform_remote_state.cdn.outputs.api_domain_name
     zone_id                = data.terraform_remote_state.cdn.outputs.api_hosted_zone_id
     evaluate_target_health = false
   }
 }