resource "aws_s3_bucket" "snaps_bucket" {
  bucket = "${var.prefix}-bucket"
  acl    = var.acl

  tags = {
    Name = "${var.prefix}-s3"
  }
}
