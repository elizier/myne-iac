output "lb_dns_name" {
        value = module.alb.lb_dns_name
}

output "lb_zone_id" {
  value =  module.alb.lb_zone_id
}

output "lb_arn" {
  value = module.alb.lb_arn
}

output "lb_id" {
  value = module.alb.lb_id
}

output "target_group_arns" {
  value = module.alb.target_group_arns
}