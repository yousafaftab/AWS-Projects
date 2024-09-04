data "aws_caller_identity" "this" {

}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name = "name"
    values = [
      "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
    ]
  }
}

data "template_file" "ec2_user_data" {
  template = <<EOF
  #cloud-config
  runcmd:
    - yum install -y nginx
    - service nginx start
    EOF
}