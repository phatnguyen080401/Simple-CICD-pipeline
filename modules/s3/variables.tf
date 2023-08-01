variable "bucket_name" {
  type = string
}

variable "bucket_tags" {
  type        = map(string)
  description = "S3 bucket tags"
  default     = {}
}

variable "bucket_object" {
  type        = string
  description = "S3 bucket object name"
}