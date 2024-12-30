variable "prefix" {
  description = "Resource name prefix"
  type        = string
}

variable "cidr_block" {
  description = "VPC CIDR block"
  type        = string
}

variable "subnet_cidr_block" {
  description = "Subnet CIDR block"
  type        = string
}

variable "map_public_ip" {
  description = "Should public IPs be mapped?"
  type        = bool
  default     = true
}
