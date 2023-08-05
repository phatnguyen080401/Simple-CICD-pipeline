# A simple CI/CD pipeline with Github Actions

In this repository, I create a simple CI/CD pipeline using Github Actions for deploying a Flask app into Elastic Beanstalk. Setup infrastructure which combines S3 bucket for storing source code and Elastic Beanstalk by Terraform.

## CI/CD pipeline
![CICD Diagram](https://github.com/phatnguyen080401/Simple-CICD-pipeline/blob/master/images/cicd-diagram.jpg)

## Prerequisties
### IAM Role
You need to create a role: `aws-elasticbeanstalk-ec2-role` with following policies for elastic beanstalk and ec2:
  * AWSElasticBeanstalkWebTier
  * AWSElasticBeanstalkWorkerTier
  * AWSElasticBeanstalkMulticontainerDocker
### Elastic Beanstalk
Create a Elastic Beanstalk application by AWS CLI: `aws elasticbeanstalk create-application --application-name simple-webapp` 
### S3 
Create a S3 bucket by AWS CLI: `aws s3api create-bucket --bucket your-bucket-name --region ap-southeast-1 --create-bucket-configuration LocationConstraint=ap-southeast-1`

Then go to: `infrastructure > main.py` and replace your bucket name to backend s3 bucket name for storing terraform state.
```
backend "s3" {
    bucket = "your-bucket-name"
    key    = "terraform.tfstate"
    region = "ap-southeast-1"
  }
```
### Github Actions
Setup secret variables in Githuh for using in workflows:
  * AWS_ACCESS_KEY_ID: AWS access key
  * AWS_SECRET_ACCESS_KEY: AWS secret access key
  * AWS_REGION: ap-southeast-1 (or choose your desired region)
