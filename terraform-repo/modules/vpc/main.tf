resource "aws_vpc" "this" {
  cidr_block           = var.cidr_block
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public" {
  cidr_block              = var.subnet_cidr_block
  vpc_id                  = aws_vpc.this.id
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.vpc_name}-public-subnet"
  }
}
