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

data "terraform_remote_state" "sgr" {
  backend   = "s3"
  workspace = terraform.workspace

  config = {
    bucket  = "myne-ieac"
    region  = var.region
    profile = "default"
    key     = "sgr/terraform.tfstate"
  }
}