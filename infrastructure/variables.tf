variable "aws_region" {
  type        = string
  description = "AWS region to use for resources"
  default     = "ap-southeast-1"
}

variable "ec2_instance_type" {
  type    = string
  default = "t3.micro"
}

# S3 bucket
variable "bucket_name" {
  type    = string
  default = "web-bucket"
}

variable "bucket_object" {
  type        = string
  description = "List of S3 bucket object name"
  default     = "webapp-src"
}

# Elastic Beanstalk
variable "ebs_app_name" {
  type    = string
  default = "simple-webapp"
}

variable "ebs_solution_stack_name" {
  type        = string
  description = "Running in Python platform environment"
  default     = "64bit Amazon Linux 2023 v4.0.2 running Python 3.11"
}
