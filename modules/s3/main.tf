# S3 bucket config
resource "aws_s3_bucket" "web_bucket" {
  bucket = var.bucket_name
  force_destroy = true

  tags = var.bucket_tags
}