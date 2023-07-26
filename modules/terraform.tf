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