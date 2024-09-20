resource "aws_lambda_function" "efs_lambda" {
  function_name = var.function_name
  role          = aws_iam_role.lambda_role.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.9"

  file_system_config {
    arn             = aws_efs_access_point.efs_access_point.arn
    local_mount_path = "/mnt/efs"
  }

  vpc_config {
    subnet_ids         = [aws_subnet.subnet.id]
    security_group_ids = [aws_security_group.lambda_sg.id]
  }

  filename         = "lambda.zip"
}


resource "aws_lambda_function_url" "lambda_url" {
  function_name = aws_lambda_function.efs_lambda.function_name
  authorization_type = "NONE"
}


output "lambda_function_url" {
  value       = aws_lambda_function_url.lambda_url.function_url
}
