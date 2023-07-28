variable "aws_region" {
  type = string
  description = "AWS region to use for resources"
  default     = "ap-southeast-1"
}

variable "bucket_name" {
  type = string
  description = "S3 bucket for staging environment"
  default = "web-bucket"
}

variable "environment" {
  type = string
  default = "staging"
}