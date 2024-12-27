resource "aws_instance" "snap_vm" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  tags = {
    Name = "snap-vm"
  }
}
