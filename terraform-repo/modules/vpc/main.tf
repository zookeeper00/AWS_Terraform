resource "aws_vpc" "snaps_vpc" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.prefix}-vpc"
  }
}

resource "aws_subnet" "snaps_subnet" {
  vpc_id                  = aws_vpc.snaps_vpc.id
  cidr_block              = var.subnet_cidr_block
  map_public_ip_on_launch = var.map_public_ip
  tags = {
    Name = "${var.prefix}-subnet"
  }
}
