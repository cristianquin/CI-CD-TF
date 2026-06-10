variable "env_name" {}

resource "aws_security_group" "ec2_sg" {
  name        = "${var.env_name}-ec2-sg"
  description = "Permitir HTTP y SSH"

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env_name}-ec2-sg"
  }
}

resource "aws_security_group" "rds_sg" {
  name        = "${var.env_name}-rds-sg"
  description = "Permitir acceso a RDS desde EC2"

  ingress {
    description = "PostgreSQL desde EC2"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    # Aquí deberías poner el ID del grupo de seguridad de EC2, si lo tienes
    security_groups = [aws_security_group.ec2_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.env_name}-rds-sg"
  }
}

output "ec2_sg_id" {
  value = aws_security_group.ec2_sg.id
}

output "rds_sg_id" {
  value = aws_security_group.rds_sg.id
}
