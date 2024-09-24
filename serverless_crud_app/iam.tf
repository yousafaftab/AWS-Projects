resource "aws_iam_role" "this" {
  name = "http-crud-tutorial-role"
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
      },
    ]
  })

  tags = {
    Name = "http-crud-tutorial-role"
  }
}

resource "aws_iam_policy" "this" {
  name        = "http-crud-tutorial-role-policy"
  path        = "/"
  description = "IAM policy to for lambda function to read and write dynamodb table"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "dynamodb:DeleteItem",
          "dynamodb:GetItem",
          "dynamodb:PutItem",
          "dynamodb:ScanItem",
          "dynamodb:UpdateItem"
        ],
        Effect   = "Allow"
        Resource = "arn:aws:dynamodb:ap-southeast-1:737457451118:table/*"
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "this" {
  name       = "http-crud-tutorial-role-policy-attachment"
  policy_arn = aws_iam_policy.this.arn
  roles      = [aws_iam_role.this.name]
}
