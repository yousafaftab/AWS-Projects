variable "aws_region" {
  description = "Region on which the infra is being deployed"
  default     = "ap-southeast-1"
  type        = string
}

variable "username" {
  description = "username that will be apllying terraform code"
  default     = ""
  type        = string
}