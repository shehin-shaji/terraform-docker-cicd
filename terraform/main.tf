provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

module "vpc" {
  source            = "./modules/vpc"
  cidr_block        = var.vpc_cidr_block
  vpc_name          = var.vpc_name
  igw_name          = var.igw_name
  route_table_name  = var.route_table_name
  subnet_cidr_block = var.subnet_cidr_block
  subnet_name       = var.subnet_name
}

module "ec2" {
  source           = "./modules/ec2"
  ami_id           = var.ami_id
  instance_type    = var.instance_type
  key_pair_name    = var.key_pair_name
  vpc_id           = module.vpc.vpc_id
  subnet_id        = module.vpc.subnet_id
  sg_name          = var.sg_name
  instance_name    = var.instance_name
  allowed_ssh_cidr = var.allowed_ssh_cidr
  volume_size      = var.volume_size
}

