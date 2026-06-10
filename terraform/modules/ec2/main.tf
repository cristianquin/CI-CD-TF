variable "env_name" {}
variable "instance_type" {}
variable "ssh_key_name" {}
variable "public_key_path" {}
variable "ami_id" {
  description = "AMI ID para EC2"
  type        = string
}
variable "security_group_id" {}

resource "aws_key_pair" "deployer" {
  key_name   = var.ssh_key_name
  public_key = file(var.public_key_path)

  lifecycle {
    ignore_changes = [public_key]
  }
}

resource "aws_instance" "app_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = "${var.env_name}-ec2"
  }
}


output "instance_id" {
  value = aws_instance.app_server.id
}

resource "aws_eip" "app_eip" {
  instance = aws_instance.app_server.id
  domain   = "vpc"
}

output "public_ip" {
  value = aws_eip.app_eip.public_ip
}
