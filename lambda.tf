resource "aws_lambda_function" "finance_lambda_function" {
  function_name = "finance-lambda-func"
  role          = aws_iam_role.lambda_rds_role.arn
  handler       = "index.handler"
  runtime       = "python3.9"
  filename      = "./Deployment/LambdaFunction/package.zip"
  
  layers = [
    aws_lambda_layer_version.finance_layer_package.arn
  ]

  vpc_config {
    subnet_ids         = [aws_subnet.public_subnet_a.id]
    security_group_ids = [aws_security_group.sg_public.id]
  }

  environment {
    variables = {
      DB_ENDPOINT = aws_db_instance.finance-db-instance.endpoint
      DB_USER     = var.db_user
      DB_PASSWORD = var.db_password
      DB_NAME     = var.db_name
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
