# Arquivo principal de variaveis terraform
variable "region" {
  type = string
}

variable "environment" {
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
}