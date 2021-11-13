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