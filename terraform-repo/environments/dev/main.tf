module "vpc" {
  source            = "../../../modules/vpc"
  prefix            = "snaps-dev"
  cidr_block        = var.vpc_cidr
  subnet_cidr_block = var.subnet_cidr
  map_public_ip     = true
}

module "s3" {
  source = "../../../modules/s3"
  prefix = "snaps-dev"
  acl    = "private"
}

module "ec2" {
  source         = "../../../modules/ec2"
  prefix         = "snaps-dev"
  ami_id         = var.ami_id
  instance_type  = "t2.micro"
  subnet_id      = module.vpc.subnet_id
  user_data      = file("scripts/dev-user-data.sh")
}
