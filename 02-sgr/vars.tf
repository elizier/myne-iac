variable "region" {
  type = string
}

variable "team" {
  type = string
}

locals {
  workspace_prefix= {
    "production" = "prd-",
    "homolog" = "hom-",
    "default" = ""
  }

  prefix = local.workspace_prefix[terraform.workspace]

  tags = {
    Team                               = var.team
    Environment                        = terraform.workspace
    Terraform                          = true
  }

  postgres_name = "${local.prefix}postgres"
  postgres_tags = merge({ Name = local.postgres_name }, local.tags)

  ec2_name = "${local.prefix}server"
  ec2_tags = merge({ Name = local.ec2_name }, local.tags)

  public_name = "${local.prefix}public"
  public_tags = merge({ Name = local.public_name }, local.tags)
}
