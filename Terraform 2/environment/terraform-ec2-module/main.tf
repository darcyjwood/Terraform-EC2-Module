terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  region = "us-west-2"
}

module "compute" {
  source               = "./module/compute"
  ami                  = "ami-0c2ab3b8efb09f272"
  instance_type        = "t2.micro"
  tag_name             = "ModuleforBasicInstance"
  sg                   = module.security.webserver_sg
  user_data            = file("./user_data.tpl")
  iam_instance_profile = module.iam.s3_profile
}

module "security" {
  source = "./module/security"
}

module "iam" {
  source                 = "./module/iam"
  role_name              = "s3-list-bucket"
  policy_name            = "s3-list-bucket"
  instance_profile_name  = "s3-list-bucket"
  path                   = "/"
  iam_policy_description = "s3 policy for ec2 to list role"
  iam_policy             = file("./s3-list-bucket-policy.tpl")
  assume_role_policy     = file("./s3-list-bucket-trusted-identity.tpl")
}
module "s3" {
  source        = "./module/s3"
  bucket_name   = "djw-terraform-ec2mod"
  acl           = "private"
  object_key    = "ec2-module"
  object_source = "/dev/null"
}
