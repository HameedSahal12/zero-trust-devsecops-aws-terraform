terraform {
  backend "s3" {
    bucket         = "mca-devsecops-terraform-state"
    key            = "global/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}

module "vpc" {
  source = "./vpc"
}

module "iam" {
  source = "./iam"
}
