output "public_ip" {
  value = aws_instance.yousaf_ec2.public_ip
  description = "The public IP address of the EC2 instance"
}
