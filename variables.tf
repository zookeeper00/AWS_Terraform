# variables.tf - Root-level variables
variable "aws_region" {
  description = "The AWS region for resource provisioning"
  type        = string
  default     = "us-west-2"
}
