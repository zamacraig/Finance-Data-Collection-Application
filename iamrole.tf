resource "aws_iam_role_policy" "lambda_rds_policy" {
  name = "lambda_rds_policy"
  role = aws_iam_role.lambda_rds_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect: "Allow",
        Action: "s3:PutObject",
        Resource: "arn:aws:s3:::*/*"
      },
      {
        "Effect" : "Allow",
        "Action": [ 
          "sns:Publish"
        ],
        "Resource": "*"
      },
      {
        Effect: "Allow",
        Action: [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource: "arn:aws:logs:*:*:*"
      }
    ]
  })
}

resource "aws_iam_role" "lambda_rds_role" {
  name = "lambda_rds_role"

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
}