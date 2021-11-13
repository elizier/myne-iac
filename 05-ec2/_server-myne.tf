
resource "aws_instance" "server-myne" {
  ami           = var.ec2-wildfly
  instance_type = "t2.micro"
  #instance_type = "t3.small" //Evolução
  #subnet_id   = aws_subnet.private[0].id
  subnet_id              = aws_subnet.public[0].id
  vpc_security_group_ids = ["${aws_security_group.wildfly.id}"]
  depends_on             = [aws_key_pair.deployer-aws]
  key_name               = aws_key_pair.deployer-aws.id
  tags = {
    Name = "server-myne"
  }
}

