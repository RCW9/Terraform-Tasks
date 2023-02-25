


data "archive_file" "demo" {
  type        = "zip"
  source_file = "demo.py"
  output_path = "outputs/demo.zip"
}



resource "aws_lambda_function" "lambda_policy" {

  filename      = "outputs/demo.zip"
  function_name = "demo"
  role          = aws_iam_role.lambda_role.arn
  handler       = "demo.handler"


  source_code_hash = filebase64sha256("outputs/demo.zip")

  runtime = "python3.9"

}