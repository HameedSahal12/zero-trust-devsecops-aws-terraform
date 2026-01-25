terraform {
  backend "s3" {
    bucket = "mca-devsecops-terraform-state"
    key    = "global/terraform.tfstate"
    region = "ap-south-1"
  }
}

module "vpc" {
  source = "./vpc"
}
