terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>5.0"
    }

    random = {
      source = "hashicorp/random"
      version = "~>3.5.0"
    }
  }
}

# Provider
provider "aws" {
  region = var.aws_region
}

# Staging environment
module "s3_staging" {
  source = "../modules/s3/"

  # Set variables
  bucket_name = local.s3_bucket_name
  bucket_tags = local.common_tags
}