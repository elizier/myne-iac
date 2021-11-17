# Arquivo principal de variaveis terraform
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

}