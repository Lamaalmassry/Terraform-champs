terraform {
    backend "s3" {
        bucket="lama-bucket-1"
        key= "s3.tfstate"
        region = "us-east-1"

    }
    
    }

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "B1" {
  bucket = "lama-bucket-2"

  tags = {
    Enviorment = "terraformChamps"
    owner      = "lama"
  }
}


resource "aws_s3_bucket_object" "logs" {
bucket = aws_s3_bucket.B1.bucket
key    = "logs-dir/" 
}

resource "aws_s3_bucket_object" "outgoing" {
bucket = aws_s3_bucket.B1.bucket
key    = "outgoing-dir/" 
}

resource "aws_s3_bucket_object" "incomming" {
bucket = aws_s3_bucket.B1.bucket
key    = "incomming-dir/" 
}

resource "aws_s3_bucket_lifecycle_configuration" "lifeCycle" {
  bucket = aws_s3_bucket.B1.id

  rule {
    id     = "log"
    status = "Enabled"
    
    filter {
      prefix = "log-dir/"
    }

    transition {
      storage_class = "STANDARD_IA"
      days          = 30
    }

    transition {
      storage_class = "GLACIER"
      days          = 90
    }

    transition {
      storage_class = "DEEP_ARCHIVE"
      days          = 180
    }

    expiration {
      days = 365
    }
  }

  rule {
    id     = "outgoing"
    status = "Enabled"

    filter {
      prefix = "outgoing-dir/"
      tag {
        key   = "name"
        value = "notDeepArchive"
      }
    }

    transition {
      storage_class = "STANDARD_IA"
      days          = 30
    }

    transition {
      storage_class = "GLACIER"
      days          = 90
    }
  }

  rule {
    id     = "ingoing"
    status = "Enabled"

    filter {
      prefix = "incomming-dir/"
      tag {
        key   = "size"
        value = "1MB-1G"
      }
    }

    transition {
      storage_class = "STANDARD_IA"
      days          = 30
    }

    transition {
      storage_class = "GLACIER"
      days          = 90
    }
  }
}
