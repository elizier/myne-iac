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

data "terraform_remote_state" "s3" {
  backend   = "s3"
  workspace = terraform.workspace

  config = {
    bucket  = "myne-iac"
    region  = var.region
    profile = "default"
    key     = "s3/terraform.tfstate"
  }
}