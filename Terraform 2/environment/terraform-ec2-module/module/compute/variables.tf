# compute variables.tf

variable "ami" {
  description = "AMI for our instance."
}

variable "instance_type" {
  description = "The instance type for our instance."
}
variable "tag_name" {
  description = "The name of tag for our instance."
}
variable "sg" {
  description = "The security group that allows public access via http and ssh."
}
variable "user_data" {
  description = "Userdata that will install webserver bashscript and display text."
}
variable "iam_instance_profile" {
  description = "IAM instance profile for the ec2 instance."
}

