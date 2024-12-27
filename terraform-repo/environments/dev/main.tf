module "vpc" {
  source             = "../../modules/vpc"
  cidr_block         = var.vpc_cidr_block
  subnet_cidr_block  = var.subnet_cidr_block
  availability_zone  = var.availability_zone
  name               = var.vpc_name
}

module "ec2" {
  source        = "../../modules/ec2"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  subnet_id     = module.vpc.subnet_id
  key_name      = var.key_name
  name          = var.ec2_name
}
