locals {
  common_tags = {
    environment = terraform.workspace
  }

  naming_prefix = "${var.bucket_name}-${terraform.workspace}"

  s3_bucket_name = "${local.naming_prefix}-${random_integer.s3_suffix.result}"
}

resource "random_integer" "s3_suffix" {
  min = 1
  max = 99999
}