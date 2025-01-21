resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  tags = {
    Name = var.instance_name
  }
}

output "ec2_instance_id" {
  value       = aws_instance.this.id
  description = "ID of the EC2 instance"
}