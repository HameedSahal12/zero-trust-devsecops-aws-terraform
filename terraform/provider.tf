terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"

  assume_role {
    role_arn = "arn:aws:iam::245221346839:role/terraform-execution-role"
  }
}

