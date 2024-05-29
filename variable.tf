variable "region" {
 description = "The AWS region to create resources in"
 type        = string
 default     = "ap-south-1"
}

variable "aws_access_key"{
 description = "AWS access key"
 type        = string
 sensitive   = true
}

variable "aws_secret_key"{
 description = "AWS secret key"
 type        = string
 sensitive   = true
}

variable "vpc_name" {
 description = "The name of the VPC"
 type        = string
}

variable "vpc_cidr" {
 description = "The CIDR block for the VPC"
 type        = string
 default     = "10.0.0.0/16"
}

variable "public_subnet_name" {
 description = "The name of the public subnet"
 type        = string
}

variable "private_subnet_name" {
 description = "The name of the private subnet"
 type        = string
}

variable "public_subnet_cidr" {
 description = "The CIDR block for the public subnet"
 type        = string
 default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
 description = "The CIDR block for the private subnet"
 type        = string
 default     = "10.0.2.0/24"
}

variable "availability_zone" {
 description = "The availability zone to launch instances in"
 type        = string
}

variable "firewall_source_ranges" {
 description = "The source ranges allowed in the firewall rule"
 type        = list(string)
 default     = ["0.0.0.0/0"]
}

variable "instance_type" {
 description = "The type of instance to use"
 type        = string
 default     = "t3.micro"
}

variable "ami_id" {
 description = "The ID of the AMI to use for the instances"
 type        = string
 default     = "ami-0763cf792771fe1bd"
}

variable "key_name" {
 description = "The key pair name to access instances"
 type        = string
}

variable "spot_price" {
 description = "The maximum price for spot instances"
 type        = string
 default     = "0.05"
}
