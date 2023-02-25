
resource "aws_iam_role" "lambda_role" {
  name = "lambda_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  }
  )
}

data "aws_iam_policy_document" "cw_document" {
  statement {

    actions = [ "logs:CreateLogGroup" ]

    resources = [
      "*"
    ]
  }

  statement {

    actions = [ "logs:CreateLogStream", "logs:PutLogEvents" ]

    resources = [
      "*"
    ]
  }
}

resource "aws_iam_policy" "cw_policy" {
    name_prefix = "cw-policyname"
    policy = data.aws_iam_policy_document.cw_document.json
}

resource "aws_iam_role_policy_attachment" "lambda_cw_policy_attachment" {
    role = aws_iam_role.lambda_role.name
    policy_arn = aws_iam_policy.cw_policy.arn
}
