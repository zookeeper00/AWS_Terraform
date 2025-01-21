module "vpc" {
  source            = "../../modules/vpc"
  vpc_name          = var.vpc_name
  cidr_block        = var.cidr_block
  subnet_cidr_block = var.public_subnet_cidr
}

module "ec2" {
  source         = "../../modules/ec2"
  instance_name  = var.ec2_name
  ami_id         = var.ami_id
  instance_type  = var.instance_type
  subnet_id      = module.vpc.public_subnet_id
}
