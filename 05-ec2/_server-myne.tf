resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCwflQbI52S4SNMyVpy7NFcsfhKxMnYtBhn8EvI6LDSLgPHl5+ghIu5Fqqj9PH0577waa3wSj+/DIzAvKOuaUtgahjIuzpTn8Vx3XrNEDxd1X9OsG8iMy/x4KSxOFX5qSMXDFksOtwBsSj3X9tPc1Gp6Relorvy5UKFZQuw5cciBvAZnrxnW/ntI9IBZVgygebV7lYf9HChwD8rN3AVFR9L7UO2yUcSjjl5/3JCU8teZAMB/SlQDYFEm/Spp7jkDviZdT5hGU5tNf8z6ZggFjz5TexUrJIqkOf2dcDqZ9pApwWczvUgppd8a9Wo03ZK/PvfLTsCw8n0vEZIHDYYVujp/w5hJ52YFJrgtxFOgO2SnM67VLoN1RViiDhuQh68oAqCT4wBkWU1W97JbOZtyv7FpWuuzg5KRDb51Ub7bqhgo0xlzvlFlbythE3yoibKZrYZ/XdtFbeCdH+seb7XMeD/71Evvba1Yrikuz+66vaHbr8Oy/DJsS7Oh4qfmShgOn39yk2PTY4DLvXaCfEVvuuqJ2K7rIm0kBdZqiYsDl0QE23785vc6qIC48C5uRXY/B4ZyJjvtJT9f8p4Puo+dPXKDVOzZdog5lTTvL5ZHSpN5g5xldXKUxbCStTPFmysLaeF2S8VWmPN12WvsOWtUgzgd0OX1IAhmLFzDuoMkHwpnQ== elizier.santos@gmail.com"
}

resource "aws_instance" "server-myne" {
  count         = var.instance_count
  ami           = var.ami
  instance_type = "t2.micro"
  #instance_type = "t3.small" //Evolução
  subnet_id              = local.subnets.0
  vpc_security_group_ids = [data.terraform_remote_state.sgr.outputs.ec2_sec_group_id]
  depends_on             = [aws_key_pair.deployer]
  key_name               = aws_key_pair.deployer.id
  tags = merge({"Name" = "server-myne"}, local.tags)
}
