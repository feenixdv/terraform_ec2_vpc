data "archive_file" "lambda_function_zip" {
  type        = "zip"
  output_path = "${path.module}/payload.zip"
  source_file = "${path.module}/lambda_function.py"
}