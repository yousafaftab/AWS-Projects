variable "aws_region" {
  description = "The AWS region where the infrastructure will be deployed. Example: ap-southeast-1 (Singapore)"
  default     = "ap-southeast-1"
  type        = string
}

variable "username" {
  description = "The username of the individual applying the Terraform code, used for resource tagging or tracking changes."
  default     = ""
  type        = string
}