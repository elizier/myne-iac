terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.64.2"
    }
  }
  backend "s3" {
    bucket  = "myne-iac"
    region  = "us-east-1"
    profile = "default"
    key     = "ec2/terraform.tfstate"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
  profile = "default"
}
