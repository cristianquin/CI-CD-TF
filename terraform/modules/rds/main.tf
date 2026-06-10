variable "env_name" {}
variable "db_name" {}
variable "db_username" {}
variable "db_password" {}
variable "db_identifier" {}
variable "security_group_id" {}

resource "aws_db_instance" "postgres" {
  allocated_storage    = 20
  engine               = "postgres"
  engine_version       = "14"
  instance_class       = "db.t3.micro"
  identifier           = var.db_identifier
  db_name              = var.db_name
  username             = var.db_username
  password             = var.db_password
  vpc_security_group_ids = [var.security_group_id]
  skip_final_snapshot  = true
  publicly_accessible  = true

  tags = {
    Name = "${var.env_name}-rds"
  }
}

output "db_endpoint" {
  value = aws_db_instance.postgres.address
}
