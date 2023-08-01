# S3 bucket
output "web_bucket" {
  value = aws_s3_bucket.web_bucket
}

# S3 bucket object
output "web_bucket_object" {
  value = aws_s3_object.web_bucket_object
}