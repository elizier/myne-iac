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