terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>5.0"
    }
  }

  # Store state files in S3 bucket
  backend "s3" {
    bucket = "value"
    key = "value"
    region = "value"
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
  bucket_name = var.bucket_name
}