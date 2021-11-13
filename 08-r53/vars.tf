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

variable "dns" {
  type = string
  description = "R53 zone"
  default = ""
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