output "bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.snap_bucket.bucket
}
