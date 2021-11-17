data "terraform_remote_state" "vpc" {
  backend   = "s3"
  workspace = terraform.workspace

  config = {
    bucket  = "myne-iac"
    region  = var.region
    profile = "default"
    key     = "vpc/terraform.tfstate"
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

data "terraform_remote_state" "sgr" {
  backend   = "s3"
  workspace = terraform.workspace

  config = {
    bucket  = "myne-iac"
    region  = var.region
    profile = "default"
    key     = "sgr/terraform.tfstate"
  }
}

data "terraform_remote_state" "ec2" {
  backend   = "s3"
  workspace = terraform.workspace

  config = {
    bucket  = "myne-iac"
    region  = var.region
    profile = "default"
    key     = "ec2/terraform.tfstate"
  }
}