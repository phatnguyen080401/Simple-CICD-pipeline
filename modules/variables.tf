variable "aws_region" {
  type = string
  description = "AWS region to use for resources"
  default     = "ap-southeast-1"
}

variable "s3_bucket_name" {
  type = object({
    staging_bucket_name = string
    prod_bucket_name = string
  })
  default = {
    staging_bucket_name = "staging_bucket"
    prod_bucket_name = "prod_bucket"
  }
}