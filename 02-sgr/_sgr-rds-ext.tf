resource "aws_security_group" "postgres_ext" {
  name        = "pg-ext"
  description = "Allow Postgres from peering Public Access"

  vpc_id = aws_vpc.this.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["168.121.77.226/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}