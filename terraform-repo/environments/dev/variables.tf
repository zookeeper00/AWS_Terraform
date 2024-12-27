variable "cidr_block" {
  description = "The CIDR block for the VPC in dev"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet in dev"
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "The availability zone for the subnet"
  type        = string
  default     = "us-west-2a"
}

variable "ami_id" {
  description = "The AMI ID for EC2 instances in dev"
  type        = string
}

variable "instance_type" {
  description = "The instance type for EC2 instances in dev"
  type        = string
  default     = "t2.micro"
}

variable "bucket_name" {
  description = "The name of the S3 bucket in dev"
  type        = string
}
