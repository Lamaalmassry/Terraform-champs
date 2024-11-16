

resource "aws_s3_bucket" "lama_bucket_workshop" {
  bucket = "lama-bucket-workshop"
}

resource "aws_s3_object" "dir" {
  bucket = aws_s3_bucket.lama_bucket_workshop.bucket
  key    = "logs/"
}

resource "aws_iam_user" "mostafa" {
  name = "Mostafa"
}

resource "aws_iam_user" "taha" {
  name = "Taha"
}

resource "aws_iam_policy" "taha_policy" {
  name        = "taha-policy"

  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action   = "s3:GetObject",
      Effect   = "Allow",
      Resource = "${aws_s3_bucket.lama_bucket_workshop.arn}/logs/*"
    }]
  })
}

resource "aws_iam_role" "taha_role" {
 
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service ="s3.amazonaws.com"
      }
    }]
  })
}

/*resource "aws_iam_role_policy_attachment" "taha_role_attachment" {
  role       = aws_iam_role.taha_role.name
  policy_arn = aws_iam_policy.taha_policy.arn
}*/

resource "aws_iam_policy" "policy_mostafa" {
  name        = "policy-mostafa"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action   = "s3:PutObject",
      Effect   = "Allow",
      Resource = "arn:aws:s3:::lama-bucket-workshop/*"
    }]
  })
}

resource "aws_iam_user_policy_attachment" "mostafa_policy_attachment" {
  user       = aws_iam_user.mostafa.name
  policy_arn = aws_iam_policy.policy_mostafa.arn
}

