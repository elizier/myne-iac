data "terraform_remote_state" "cdn" {
  backend   = "s3"
  workspace = terraform.workspace

  config = {
    bucket  = "myne-iac"
    region  = var.region
    profile = "default"
    key     = "cdn/terraform.tfstate"
  }
}

data "terraform_remote_state" "zone" {
  backend   = "s3"
  workspace = terraform.workspace

  config = {
    bucket  = "myne-iac"
    region  = var.region
    profile = "default"
    key     = "zone/terraform.tfstate"
  }
}

data "terraform_remote_state" "alb" {
  backend   = "s3"
  workspace = terraform.workspace

  config = {
    bucket  = "myne-iac"
    region  = var.region
    profile = "default"
    key     = "alb/terraform.tfstate"
  }
}