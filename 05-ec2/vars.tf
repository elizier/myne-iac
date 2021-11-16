variable "region" {
  type = string
}

variable "team" {
  type = string
}

variable "instance_count" {
  type = number
}

variable "ami"{
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

  tags = {
    Team                               = var.team
    Environment                        = terraform.workspace
    Terraform                          = true
  }

  subnets = terraform.workspace == "homolog" ? data.terraform_remote_state.vpc.outputs.public_subnets : data.terraform_remote_state.vpc.outputs.private_subnets

}
