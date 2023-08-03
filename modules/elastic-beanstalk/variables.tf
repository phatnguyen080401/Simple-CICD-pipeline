variable "ebs_name" {
  type = string
}

variable "ebs_solution_stack_name" {
  type = string
}

variable "ebs_tags" {
  type        = map(string)
  description = "Elastic Beanstalk tags"
  default     = {}
}

variable "s3_bucket_id" {
  type = string
}

variable "s3_bucket_object_id" {
  type = string
}

variable "ec2_instance_type" {
  type = string
}

variable "iam_instance_profile_name" {
  type = string
}