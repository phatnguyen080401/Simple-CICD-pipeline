data "aws_elastic_beanstalk_hosted_zone" "current" {}

data "aws_elastic_beanstalk_application" "existing_application" {
  name = var.ebs_app_name
}

resource "aws_elastic_beanstalk_environment" "ebs_env" {
  name                = "${terraform.workspace}-env"
  application         = var.ebs_app_name 
  solution_stack_name = var.ebs_solution_stack_name
  tags                = var.ebs_tags

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "aws-elasticbeanstalk-ec2-role"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = var.ec2_instance_type
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "LoadBalancerType"
    value     = "application"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBScheme"
    value     = "internet facing"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment:process:default"
    name      = "MatcherHTTPCode"
    value     = 200
  }
}