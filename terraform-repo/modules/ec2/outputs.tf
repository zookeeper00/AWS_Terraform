output "instance_id" {
  value = aws_instance.this.id
  description = "ID of the EC2 instance"
}