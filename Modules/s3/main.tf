resource "aws_s3_bucket" "s3_bucket_terraform" {
  bucket = var.s3_bucket_name
}