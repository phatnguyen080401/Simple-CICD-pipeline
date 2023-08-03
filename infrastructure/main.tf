terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~>3.5.0"
    }
  }

  backend "s3" {
    bucket = "terraform-backend-0"
    key    = "terraform.tfstate"
    region = "ap-southeast-1"
  }
}

# Provider
provider "aws" {
  region = var.aws_region
}

# S3 bucket 
module "s3_bucket" {
  source = "../modules/s3/"

  # Set variables
  bucket_name   = local.s3_bucket_name
  bucket_tags   = local.common_tags
  bucket_object = var.bucket_object
}

# Elastic Beanstalk 
module "elastic_beanstalk" {
  source = "../modules/elastic_beanstalk/"

  depends_on = [module.s3_bucket]

  # Set variables
  ebs_app_name              = var.ebs_app_name
  ebs_solution_stack_name   = var.ebs_solution_stack_name
  ebs_tags                  = local.common_tags
  s3_bucket_id              = module.s3_bucket.web_bucket.id
  s3_bucket_object_id       = module.s3_bucket.web_bucket_object.id
  ec2_instance_type         = var.ec2_instance_type
} 