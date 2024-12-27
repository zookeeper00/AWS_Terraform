resource "aws_s3_bucket" "snap_bucket" {
  bucket = var.bucket_name
  acl    = "private"

  tags = {
    Name = "snap-bucket"
  }
}
