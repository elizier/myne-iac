variable "region" {
  type = string
}

variable "team" {
  type = string
}

variable "postgres_instance_class" {
  type = string
}

variable "postgres_multi_az" {
  type = bool
}

variable "postgres_allocated_storage" {
  type = number
}

variable "postgres_max_allocated_storage" {
  type = number
}

variable "deletion_protection" {
  type = bool
}

locals {
  workspace_prefix= {
    "production" = "prd-",
    "homolog" = "hom-",
    "default" = ""
  }

  postgres_dbname = "${local.prefix}postgres"

  postgres_workspace_backup_retention_period = {
    "production": 3,
    "homolog": 0
  }

  postgres_backup_retention_period = local.postgres_workspace_backup_retention_period[terraform.workspace]

  prefix = local.workspace_prefix[terraform.workspace]

  tags = {
    Team                               = var.team
    Environment                        = terraform.workspace
    Terraform                          = true
  }


}