module "vpc" {
  source             = "../../modules/vpc"
  cidr_block        = var.cidr_block
  public_subnet_cidr = var.public_subnet_cidr
  availability_zone  = var.availability_zone
}

module "ec2" {
  source        = "../../modules/ec2"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  subnet_id     = module.vpc.public_subnet_id
}

module "s3" {
  source      = "../../modules/s3"
  bucket_name = var.bucket_name
}

