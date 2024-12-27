resource "aws_vpc" "snaps" {
  cidr_block = var.cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "snaps"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.snaps.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true
  tags = {
    Name = "snaps-public-subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.snaps.id
  tags = {
    Name = "snaps-igw"
  }
}

resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.snaps.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "snaps-public-route-table"
  }
}

resource "aws_route_table_association" "public_route_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route.id
}
