output "vpc_id" {
    description = "value of vpc id"
    value = aws_vpc.this.id
}

output "public_subnet_cidr" {
    description = "value of public subnet cidr"
    value = aws_subnet.public.id
  
}

output "public_subnet_id" {
  value = aws_subnet.public.id  # Ensure this matches your actual public subnet resource
  description = "The ID of the public subnet"
}
