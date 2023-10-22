terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.13.1"

    }
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      ccname      = "dataops"
      environment = "dev"
      purpose     = "opentofutest"
      managedby   = "opentofu"
    }
  }
}