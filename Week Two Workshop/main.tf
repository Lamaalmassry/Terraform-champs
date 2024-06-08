
resource "aws_s3_bucket" "terraformbucket" {
    bucket = var.bucket_name

    tags = {
      "Enviorment" = var.Enviorment
       "owner" =var.owner
    }

}
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.terraformbucket.id
  versioning_configuration {
    status = "Enabled"
  }

}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.terraformbucket.id


rule {
  apply_server_side_encryption_by_default {
    sse_algorithm="AES256"
}
 
    bucket_key_enabled = true
  }
}


resource "aws_s3_bucket_lifecycle_configuration" "lifecycle" {
  bucket = aws_s3_bucket.terraformbucket.id

  rule {
    id     = "expire object after 7 days"
    status = "Enabled"

    expiration {
      days = 7
    }
  }
}



