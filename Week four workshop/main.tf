resource "aws_s3_bucket" "lama_bucket_workshop" {
  bucket = "lama-bucket-workshop"
}

resource "aws_s3_object" "dir" {
  bucket = aws_s3_bucket.lama_bucket_workshop.bucket
  key    = "logs/"
}



resource "aws_iam_role" "ec2_full_access" {
 

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_full_access" {
  role       = aws_iam_role.ec2_full_access.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_instance_profile" "ec2_full_access" {
  role = aws_iam_role.ec2_full_access.name
}


resource "aws_instance" "ec2" {
  ami                    = "ami-08a0d1e16fc3f61ea" 
  instance_type          = "t2.micro"
  iam_instance_profile   = aws_iam_instance_profile.ec2_full_access.name
key_name = "ec2_key"

}
