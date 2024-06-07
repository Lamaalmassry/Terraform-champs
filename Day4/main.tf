terraform {
backend "s3" {
bucket = "erakiterrafromstatefiles"
key    = "s3.tfstatelama"
region = "us-east-1"
}
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "ahmed-user" {
  name = "Ahmed"

    tags = {
    Environment = "terraformChamps"
    owner       = "lama"
  }
}

resource "aws_iam_user_policy_attachment" "ec2" {
  user       = aws_iam_user.ahmed-user.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  
}


resource "aws_s3_bucket" "B1" {
  bucket = "lama-bucket-1"

  tags = {
    Environment = "terraformChamps"
    owner       = "lama"
  }
}

resource "aws_iam_user" "mahmoud-user" {
  name = "Mahmoud" 
    tags = {
    Environment = "terraformChamps"
    owner       = "lama"
  }
}

resource "aws_iam_policy" "mahmoud_s3_policy" {
  name   = "mahmoud_s3_policy"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = ["s3:PutObject", "s3:GetObject"],
        Resource = "arn:aws:s3:::lama-bucket-1/*",
        Condition = {
          IpAddress = {
            "aws:SourceIp" = "public ip"
          }
        }
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "mahmoud_policy_attachment" {
  user       = aws_iam_user.mahmoud-user.name
  policy_arn = aws_iam_policy.mahmoud_s3_policy.arn
}

resource "aws_iam_user" "mostafa" {
  name = "Mostafa" 
    tags = {
    Environment = "terraformChamps"
    owner       = "lama"
  }
}

resource "aws_iam_policy" "s3_get_policy" {
  name   = "S3GetPolicy"
    tags = {
    Environment = "terraformChamps"
    owner       = "lama"
  }
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = "s3:GetObject",
        Resource = "arn:aws:s3:::lama-bucket-1/*"
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "mostafa_policy_attachment" {
  user       = aws_iam_user.mostafa.name
  policy_arn = aws_iam_policy.s3_get_policy.arn
}