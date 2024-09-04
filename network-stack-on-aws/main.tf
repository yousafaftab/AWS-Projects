module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~>5.13"

  name = local.name

  cidr = "10.10.0.0/16"

  azs = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]

  private_subnets = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
  public_subnets  = ["10.10.11.0/24", "10.10.12.0/24", "10.10.13.0/24"]

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = local.tags
}

module "asg" {
  source          = "terraform-aws-modules/autoscaling/aws"
  version         = "~>8.0"
  name            = local.name
  image_id        = data.aws_ami.amazon_linux.id
  instance_type   = "t2.micro"
  security_groups = [module.ec2_security_group.security_group_id]
  user_data       = local.ec2_user_data

  min_size                  = 1
  max_size                  = 2
  desired_capacity          = 1
  wait_for_capacity_timeout = 0
  health_check_type         = "EC2"
  vpc_zone_identifier       = module.vpc.public_subnets
  tags                      = local.tags
}

module "ec2_security_group" {
  source              = "terraform-aws-modules/security-group/aws"
  version             = "~>5.2"
  name                = local.name
  description         = "EC2 security group with publicly open HTTP and SSH ports"
  vpc_id              = module.vpc.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "ssh-tcp", "all-icmp"]
  egress_cidr_blocks  = ["0.0.0.0/0"]
  egress_rules        = ["all-all"]
  tags                = local.tags
}