variable "prefix" {
  description = "Resource name prefix"
  type        = string
}

variable "acl" {
  description = "ACL for the bucket"
  type        = string
  default     = "private"
}
