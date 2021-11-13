variable "region" {
  type = string
}

variable "dns" {
  type = string
  description = "R53 zone"
  default = ""
}

variable "alternative_names" {
  type = list(string)
  default = []
}

variable "team" {
  type = string
}

locals {
  tags = {
    Team                               = var.team
    Environment                        = terraform.workspace
    Terraform                          = true
  }

  zones = {
    "production"  = "myne.net.br",
    "homolog"     = "myne.digital",
    "services"    = "myne.services",
    "default"     = ""
  }
  acm_certificate_tags = merge({ Name = var.dns }, local.tags)
  route53_zone_tags    = merge({ Name = var.dns }, local.tags)
}