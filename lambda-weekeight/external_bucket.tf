resource "aws_s3_bucket" "external_bucket" {
  bucket = var.name_external_bucket
    force_destroy = true
}