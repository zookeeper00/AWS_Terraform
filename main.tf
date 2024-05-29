
# Define a VPC

resource "aws_vpc" "my_vpc" {

  cidr_block = var.vpc_cidr

  tags = {

    Name = var.vpc_name

  }

}

# Define a public subnet

resource "aws_subnet" "public_subnet" {

  vpc_id                  = aws_vpc.my_vpc.id

  cidr_block              = var.public_subnet_cidr

  map_public_ip_on_launch = true

  availability_zone       = var.availability_zone

  tags = {

    Name = var.public_subnet_name

  }

}

# Define a private subnet

resource "aws_subnet" "private_subnet" {

  vpc_id            = aws_vpc.my_vpc.id

  cidr_block        = var.private_subnet_cidr

  availability_zone = var.availability_zone

  tags = {

    Name = var.private_subnet_name

  }

}

# Define an Internet Gateway

resource "aws_internet_gateway" "igw" {

  vpc_id = aws_vpc.my_vpc.id

  tags = {

    Name = "${var.vpc_name}-igw"

  }

}

# Define a route table for the public subnet

resource "aws_route_table" "public" {

  vpc_id = aws_vpc.my_vpc.id

  route {

    cidr_block = "0.0.0.0/0"

    gateway_id = aws_internet_gateway.igw.id

  }

  tags = {

    Name = "${var.vpc_name}-public-rt"

  }

}

# Associate the public subnet with the route table

resource "aws_route_table_association" "public" {

  subnet_id      = aws_subnet.public_subnet.id

  route_table_id = aws_route_table.public.id

}

# Define a security group to allow incoming HTTP, HTTPS, and SSH traffic

#resource "aws_security_group" "allow_traffic" {

#  vpc_id = aws_vpc.my_vpc.id

#  name   = "allow-traffic"

#  ingress {

#    from_port   = 80

#    to_port     = 80

#    protocol    = "tcp"

#    cidr_blocks = var.firewall_source_ranges

# }

#  ingress {

#    from_port   = 443

#    to_port     = 443

#    protocol    = "tcp"

#    cidr_blocks = var.firewall_source_ranges

#  }

#  ingress {

#    from_port   = 22

#    to_port     = 22

#    protocol    = "tcp"

#    cidr_blocks = var.firewall_source_ranges

#  }

#  egress {

#    from_port   = 0

#    to_port     = 0

#    protocol    = "-1"

#    cidr_blocks = ["0.0.0.0/0"]

#  }

#  tags = {

#    Name = "allow-traffic"

#  }

#}

# Launch 15 spot instances

resource "aws_spot_instance_request" "spot_instances" {

  count         = 15

  ami           = var.ami_id

  instance_type = var.instance_type

  spot_price    = var.spot_price

  key_name      = var.key_name

  subnet_id     = aws_subnet.public_subnet.id

  associate_public_ip_address = true

  wait_for_fulfillment        = true

  tags = {

    Name = "spot-instance-${count.index}"

  }

  root_block_device {

    volume_size = 20

    volume_type = "gp2"

  }

 # security_groups = [aws_security_group.allow_traffic.name]
 # depends_on = [aws_security_group.allow_traffic,aws_route_table_association.public]
}
