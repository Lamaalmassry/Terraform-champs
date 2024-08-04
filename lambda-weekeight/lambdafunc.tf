resource "aws_lambda_function" "movefiles" {
  function_name = var.name_lambda_function
  role          = aws_iam_role.lambda_role.arn
  handler       = "lambdafunction.lambda_handler"
  runtime       = "python3.8"
  filename      = "lambda.zip"

  environment {
    variables = {
      DEST_BUCKET = aws_s3_bucket.internal_bucket.bucket
    }
  }
}

resource "aws_lambda_permission" "allow_s3_invoke" {
  
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.movefiles.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.external_bucket.arn
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.external_bucket.bucket

  lambda_function {
    lambda_function_arn = aws_lambda_function.movefiles.arn
    events              = ["s3:ObjectCreated:*"]
        filter_suffix = ".txt"
  }
}
