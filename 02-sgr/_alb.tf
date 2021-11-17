resource "aws_security_group" "alb" {
  name        = local.public_name
  tags        = local.public_tags

  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

   ingress {
     from_port   = 80
     to_port     = 80
     protocol    = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
   }

   ingress {
     from_port   = 443
     to_port     = 443
     protocol    = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
   }

}