# Staging environment
module "staging_env" {
  source = "./modules/staging/"

  # Set variables
  s3_bucket_name = var.s3_bucket_name.staging_bucket_name
}

# Product environment
module "prod_env" {
  source = "./modules/prod/"

  # Set variables
  s3_bucket_name = var.s3_bucket_name.prod_bucket_name
}