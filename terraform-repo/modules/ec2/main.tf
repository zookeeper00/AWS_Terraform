resource "aws_instance" "snaps_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  tags = {
    Name = "${var.prefix}-ec2"
  }

  user_data = var.user_data != "" ? var.user_data : null
}
