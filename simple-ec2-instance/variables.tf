# Variables definition
variable "ec2_name" {
  description = "Name of EC2 Instance"
  default = ""
  type = string
}

variable "instance_type" {
  description = "Type of EC2 Instance"
  default = "t2.micro"
  type = string
}

variable "aws_region" {
  description = "Region on which the infra is being deployed"
  default = "ap-southeast-1"
  type = string
}
