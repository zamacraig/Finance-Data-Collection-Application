resource "aws_lambda_function" "finance_lambda_function" {
  function_name = "finance-lambda-func"
  role          = aws_iam_role.lambda_rds_role.arn
  handler       = "index.handler"
  runtime       = "python3.9"
  filename      = "./Deployment/LambdaFunction/package.zip"
  timeout = 10
  
  layers = [
    aws_lambda_layer_version.finance_layer_package.arn
  ]

  vpc_config {
    subnet_ids         = [aws_subnet.public_subnet_a.id]
    security_group_ids = [aws_security_group.sg_public.id]
  }

  environment {
    variables = {
      DB_ENDPOINT = "test" #aws_db_instance.finance-db-instance.endpoint
      DB_USER     = var.db_user
      DB_PASSWORD = var.db_password
      DB_NAME     = var.db_name
      SNS_TOPIC_ARN = aws_sns_topic.lambda_exec_result.arn
      S3_BUCKET = aws_s3_bucket.financedata_bucket001.arn
    }
  }

  source_code_hash = filebase64sha256("./Deployment/LambdaFunction/package.zip")
}


resource "aws_lambda_layer_version" "finance_layer_package" {
  layer_name = "finance_layer_package"
  description = "Layer for shared dependencies"

  compatible_runtimes = ["python3.9"]
  s3_bucket           = "lambdalayerpackages001"
  s3_key              = "FinanceData/layer.zip"

  #source_code_hash = filebase64sha256("FinanceData/layer.zip")
}

resource "aws_iam_role" "lambda_exec" {
  name = "lambda_exec_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

resource "aws_cloudwatch_event_rule" "finance_lambda_schedule" {
  name                = "lambda_schedule_rule"
  description         = "Scheduled rule to trigger Lambda function"
  schedule_expression = "cron(29 17 * * ? *)" # Adjust the cron expression to your needs
}

resource "aws_cloudwatch_event_target" "lambda_target" {
  rule      = aws_cloudwatch_event_rule.finance_lambda_schedule.name
  target_id = "my_lambda_target"
  arn       = aws_lambda_function.finance_lambda_function.arn
}

resource "aws_lambda_permission" "allow_cloudwatch" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.finance_lambda_function.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.finance_lambda_schedule.arn
}

resource "aws_iam_policy" "lambda_policy" {
  name        = "lambda_policy"
  description = "IAM policy for Lambda function to write to CloudWatch Logs and S3"

  policy = jsonencode({
    Version: "2012-10-17",
    Statement: [
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

resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}