terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.36.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = var.region
}