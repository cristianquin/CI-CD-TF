module "security_group" {
  source   = "./modules/security_group"
  env_name = var.env_name
}

module "ec2" {
  source              = "./modules/ec2"
  env_name            = var.env_name
  instance_type       = var.instance_type
  ssh_key_name        = var.ssh_key_name
  public_key_path     = var.public_key_path
  ami_id              = var.ami_id
  security_group_id   = module.security_group.ec2_sg_id
}

module "rds" {
  source             = "./modules/rds"
  env_name           = var.env_name
  db_name            = var.db_name
  db_username        = var.db_username
  db_password        = var.db_password
  db_identifier      = var.db_identifier
  security_group_id  = module.security_group.rds_sg_id
}


module "s3" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
}
