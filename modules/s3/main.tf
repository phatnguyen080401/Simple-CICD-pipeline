# S3 bucket config
resource "aws_s3_bucket" "web_bucket" {
  bucket        = var.bucket_name
  force_destroy = true

  tags = var.bucket_tags
}

# S3 Bucket object
resource "aws_s3_object" "web_bucket_object" {
  bucket = aws_s3_bucket.web_bucket.id
  key    = "${var.bucket_object}/"
}