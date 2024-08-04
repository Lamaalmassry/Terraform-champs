resource "aws_s3_bucket" "internal_bucket" {
  bucket = var.name_internal_bucket
  force_destroy = true
}