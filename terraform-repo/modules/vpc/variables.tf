variable "vpc_name" {
  description = "Name of VPC"
  type        = string
}

variable "cidr_block" {
  description = "VPC CIDR block"
  type        = string
}

variable "subnet_cidr_block" {
  description = "CIDR block for Public Subnets"
  type        = string
}

