output "vpc_id" {
  value = aws_vpc.snaps_vpc.id
}

output "subnet_id" {
  value = aws_subnet.snaps_subnet.id
}
