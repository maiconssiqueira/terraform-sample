terraform {
  backend "s3" {
    bucket = "pucmr-remote-state-manu"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.28.0"
    }
  }
}

provider "aws" {
  default_tags {
    tags = {
      Terraform   = "true"
      Environment = "${terraform.workspace}"
    }
  }
}
