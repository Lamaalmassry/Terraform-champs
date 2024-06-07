provider "aws" {
    region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "lama-bucket-1"
    key    = "s3.tfstate"
    region = "us-east-1"
  }
}

resource "aws_s3_bucket" "B1" {
  bucket        = "lama-bucket-1"
force_destroy = true
  tags = {
    Environment = "terraformChamps"
    Owner       = "lama"
  }

  versioning{
    enabled =true
  }

  acl = "private" 
  
  }

  
resource "aws_s3_bucket_object" "logs" {
  bucket = aws_s3_bucket.B1.bucket
  key    = "logs/"
 
}

resource "aws_s3_bucket_policy" "B1_policy" {
  bucket = aws_s3_bucket.B1.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = "s3:PutObject",
        Resource = "${aws_s3_bucket.B1.arn}/logs/*",
        Principal = {
          AWS = "arn:aws:iam::891377122503:user/lama"
        }
      }
    ]
  })
}



output "bucket_name" {
  value = aws_s3_bucket.B1.bucket
}
