output "hosted-zone" {
  value = data.aws_elastic_beanstalk_hosted_zone.current.id
}

output "ebs_env_name" {
  value = aws_elastic_beanstalk_environment.staging_env.name
}

output "ebs_cname" {
  value = aws_elastic_beanstalk_environment.staging_env.cname
}
