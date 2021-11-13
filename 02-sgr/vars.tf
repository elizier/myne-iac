# Arquivo principal de variaveis terraform
variable "region" {
  type = string
}

variable "name" {
  type = string
}

variable "team" {
  type = string
}

variable "azs" {
  type = list(string)
}

variable "cidr" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}

variable "database_subnets" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}

variable "single_nat_gateway" {
  type = bool
}

locals {
  workspace_prefix= {
    "production" = "prd-",
    "homolog" = "hom-",
    "default" = ""
  }

  zones = {
    "production"  = "myne.net.br",
    "homolog"     = "myne.digital",
    "service"     = "myne.services",
    "default"     = ""
  }
  prefix = local.workspace_prefix[terraform.workspace]

  vpc_name = "${local.prefix}${var.name}"

  tags = {
    Team                               = var.team
    Environment                        = terraform.workspace
    Terraform                          = true
  }

  public_subnet_tags = {
  }

  private_subnet_tags = {
  }
}