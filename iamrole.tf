resource "aws_iam_role_policy" "lambda_rds_policy" {
  name = "lambda_rds_policy"
  role = aws_iam_role.lambda_rds_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
       {
        Action = [
          "rds:DescribeDBInstances",
          "rds:Connect",
          "rds:DescribeDBLogFiles",
          "rds:DownloadDBLogFilePortion",
        ],
        Effect   = "Allow",
        Resource = "*"
      },
      {
        "Effect": "Allow",
        "Action": [
            "ec2:CreateNetworkInterface",
            "ec2:DescribeNetworkInterfaces",
            "ec2:DeleteNetworkInterface"
        ],
        "Resource": "*"
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