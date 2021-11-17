resource "aws_alb" "api_myne_alb" {
  name            = "api-myne-load-balancer"
  subnets         = data.terraform_remote_state.vpc.outputs.public_subnets
  security_groups = [data.terraform_remote_state.sgr.outputs.ec2_sec_group_id]
  tags            = local.tags
}

resource "aws_alb_target_group" "api_myne_alb_tg" {
  name     = "api-myne-target-group"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = data.terraform_remote_state.vpc.outputs.vpc_id
  tags     = local.tags

  health_check {
    healthy_threshold   = "3"
    interval            = "30"
    protocol            = "HTTP"
    matcher             = "200"
    timeout             = "3"
    path                = "/"
    unhealthy_threshold = "2"
  }
}

resource "aws_alb_target_group_attachment" "api_myne_tg_attachment" {
  for_each         = toset(data.terraform_remote_state.ec2.outputs.instance_ids)
  target_group_arn = aws_alb_target_group.api_myne_alb_tg.arn
  target_id        = each.value
  port             = 8080
}


resource "aws_lb_listener" "api_myne_lb_listener_https" {
  load_balancer_arn = aws_alb.api_myne_alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = data.terraform_remote_state.zone.outputs.public_certificate_arn
  tags              = local.tags

  default_action {
    target_group_arn = aws_alb_target_group.api_myne_alb_tg.id
    type             = "forward"
  }
}


resource "aws_alb_listener" "api_myne_alb_listener_http" {
  load_balancer_arn = aws_alb.api_myne_alb.id
  port              = 80
  protocol          = "HTTP"
  tags              = local.tags

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

