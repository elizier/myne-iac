resource "aws_alb" "api_myne_alb" {
  name            = "api-myne-load-balancer"
  subnets         = aws_subnet.public.*.id
  security_groups = [aws_security_group.wildfly.id]
}

resource "aws_alb_target_group" "api_myne_alb_tg" {
  name     = "api-myne-target-group"
  port     = 8080
  protocol = "HTTP"
  vpc_id   = aws_vpc.this.id

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
  target_group_arn = aws_alb_target_group.api_myne_alb_tg.arn
  target_id        = aws_instance.server-myne.id
  port             = 8080
}


resource "aws_lb_listener" "api_myne_lb_listener_https" {
  load_balancer_arn = aws_alb.api_myne_alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = aws_acm_certificate.myneservicescert.arn


  default_action {
    target_group_arn = aws_alb_target_group.api_myne_alb_tg.id
    type             = "forward"
  }
}


resource "aws_alb_listener" "api_myne_alb_listener_http" {
  load_balancer_arn = aws_alb.api_myne_alb.id
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }

}

