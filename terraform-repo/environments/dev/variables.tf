variable "ami_id" {
  description = "AMI ID for the development EC2 instance"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR block for development"
  type        = string
}

variable "subnet_cidr" {
  description = "Subnet CIDR block for development"
  type        = string
}
