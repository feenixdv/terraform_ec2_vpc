resource "aws_lambda_function" "sample_lambda" {
  filename      = data.archive_file.lambda_function_zip.output_path
  #function_name = "sample_lambda_function"
  function_name = "${var.function_name}_payload"
  role          = aws_iam_role.lambda_role.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = var.runtime
  source_code_hash = data.archive_file.lambda_function_zip.output_base64sha256

  environment {
    variables = {
      ENVIRONMENT = var.env
    }
  }
}

# To print lambda functional URL
resource "aws_lambda_function_url" "function_url"{
  function_name = aws_lambda_function.sample_lambda.arn
  authorization_type = "NONE"
}

resource "aws_cloudwatch_log_group" "lambda_logs" {
  name              = "/aws/lambda/${aws_lambda_function.sample_lambda.function_name}"
  retention_in_days = 7
}

resource "aws_lambda_permission" "allow_cloudwatch" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.sample_lambda.arn
  principal     = "logs.${data.aws_region.current.name}.amazonaws.com"
  source_arn    = aws_cloudwatch_log_group.lambda_logs.arn
}

output "lambda_function_invoke_url" {
  value = aws_lambda_function_url.function_url.function_url
}

data "aws_region" "current" {}
