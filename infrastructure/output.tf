output "domain-url" {
  value = module.elastic_beanstalk.ebs_cname
}

output "s3-bucket-name" {
  value = module.s3_bucket.web_bucket.id
}

output "s3-bucket-object-name" {
  value = module.s3_bucket.web_bucket_object.id
}

output "s3-bucket-url" {
  value = "s3://${module.s3_bucket.web_bucket.id}/${module.s3_bucket.web_bucket_object.id}"
}
