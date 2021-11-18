resource "aws_security_group" "postgres" {
  name        = local.postgres_name
  tags        = local.postgres_tags

  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # ["168.121.77.226/32"]  # é muito importante que aqui só estejam os ips da empresa.
  }
}

