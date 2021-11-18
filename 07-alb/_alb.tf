module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "6.3.0"

  name = "${local.prefix}alb"
  tags = local.tags

  load_balancer_type = "application"

  vpc_id             = data.terraform_remote_state.vpc.outputs.vpc_id
  subnets            = data.terraform_remote_state.vpc.outputs.public_subnets
  security_groups    = [data.terraform_remote_state.sgr.outputs.public_sec_group_id]

#  access_logs = {
#    bucket = data.terraform_remote_state.s3.outputs.alb_access_logs_bucket_name
#  }

  internal                    = false
  idle_timeout                = 120
  enable_deletion_protection  = false
  enable_http2                = false
  ip_address_type             = "ipv4"
  listener_ssl_policy_default = "ELBSecurityPolicy-2016-08"

  target_groups = [
    {
      name_prefix      = "${local.prefix}tg"
      backend_protocol = "HTTP"
      backend_port     = 8080
      target_type      = "instance"
      deregistration_delay = 15
      slow_start = 0
      health_check = {
        interval            = 30
        path                = "/"
        protocol            = "HTTP"
        timeout             = 10
        healthy_threshold   = 3
        unhealthy_threshold = 3
        matcher             = 200
      }
    }
  ]

  https_listeners = [
    {
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = data.terraform_remote_state.zone.outputs.public_certificate_arn
      target_group_index = 0
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      action_type = "redirect"
      redirect = {
        port        = "443"
        protocol    = "HTTPS"
        status_code = "HTTP_301"
      }
    }
  ]
}


resource "aws_alb_target_group_attachment" "tg_attachment" {
  for_each         = toset(data.terraform_remote_state.ec2.outputs.instance_ids)
  target_group_arn = module.alb.target_group_arns.0
  target_id        = each.value
  port             = 8080
}