data "aws_iam_policy_document" "assume_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

# Create IAM role
resource "aws_iam_role" "ebs_ec2_role" {
  name               = var.iam_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_policy.json
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier",
    "arn:aws:iam::aws:policy/AWSElasticBeanstalkMulticontainerDocker",
    "arn:aws:iam::aws:policy/AWSElasticBeanstalkWorkerTier"
  ]
  tags = local.common_tags
}

# Create IAM instance profile
resource "aws_iam_instance_profile" "ebs_ec2_profile" {
  name = var.iam_instance_profile
  role = aws_iam_role.ebs_ec2_role.name
  tags = local.common_tags
}
