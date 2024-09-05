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

#################################
########## VPC VARIABLES ########
#################################
variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}

variable "availability_zones" {
  description = "Availability zones for VPC"
  type        = list(string)
  default     = ["ap-southeast-1a"]
}

variable "vpc_private_subnets" {
  description = "Private subnets of VPC"
  type        = list(string)
}

variable "vpc_public_subnets" {
  description = "Public subnets of VPC"
  type        = list(string)
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames"
  type        = bool
  default     = false
}

variable "enable_dns_support" {
  description = "Enable DNS support"
  type        = bool
  default     = false
}

variable "enable_nat_gateway" {
  description = "Enable NAT gateway"
  type        = bool
  default     = false
}

variable "single_nat_gateway" {
  description = "Single NAT gateway"
  type        = bool
  default     = false
}

#################################
########## ASG VARIABLES ########
#################################

variable "instance_type" {
  description = "Type of EC2 instance to be deployed by auto scaling group"
  type        = string
}

variable "min_size_asg" {
  description = "Minimum EC2 Instances required by auto scaling group"
  type        = number
  default     = 0
}

variable "max_size_asg" {
  description = "Maximum EC2 Instances required by auto scaling group"
  type        = number
  default     = 0
}

variable "desired_capacity_asg" {
  description = "Minimum EC2 Instances Desired by auto scaling group"
  type        = number
  default     = 0
}

variable "wait_for_capacity_timeout" {
  description = "Wait for capacity timeout"
  type        = number
  default     = 0
}

variable "health_check_type" {
  description = "Type of auto scaling group health checks"
  type        = string
}

#################################
########## SG VARIABLES #########
#################################

variable "sg_description" {
  description = "Description of EC2 Security Group"
  type        = string
}

variable "sg_ingress_cidr_block" {
  description = "Ingress CIDR block"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "sg_ingress_rules" {
  description = "Ingress Rules"
  type        = list(string)
  default     = ["http-80-tcp"]
}

variable "sg_egress_cidr_block" {
  description = "Egress CIDR block"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "sg_egress_rules" {
  description = "Egress Rules"
  type        = list(string)
  default     = ["all-all"]
}