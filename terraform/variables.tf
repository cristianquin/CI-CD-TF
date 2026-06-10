variable "env_name" {
  description = "Nombre del ambiente (dev, test, prod)"
  type        = string
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  type        = string
}

variable "db_name" {
  description = "Nombre de la base de datos RDS"
  type        = string
}

variable "db_username" {
  description = "Usuario de la base de datos"
  type        = string
}

variable "db_password" {
  description = "Contraseña de la base de datos"
  type        = string
  sensitive   = true
}

variable "db_identifier" {
  description = "Identificador único para la base de datos RDS"
  type        = string
}

variable "bucket_name" {
  description = "Nombre del bucket S3"
  type        = string
}

variable "aws_region" {
  description = "Región de AWS"
  type        = string
}

variable "ssh_key_name" {
  description = "Nombre del par de llaves SSH en AWS"
  type        = string
}

variable "public_key_path" {
  description = "Ruta local del archivo de clave pública SSH (.pub)"
  type        = string
}

variable "ami_id" {
  description = "ID de la AMI para la instancia EC2"
  type        = string
}

variable "server_name" {
  description = "Nombre del servidor (para etiquetas, etc)"
  type        = string
}

variable "environment" {
  description = "Nombre del entorno (dev, test, prod)"
  type        = string
}
