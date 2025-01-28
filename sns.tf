resource "aws_sns_topic" "lambda_exec_result" {
  name        = "lambdaExecResult"  # Ensure the topic name is valid
  display_name = "Lambda Execution Result"
}

resource "aws_sns_topic_subscription" "sns_email_subscription" {
  topic_arn = aws_sns_topic.lambda_exec_result.arn
  protocol  = "email"
  endpoint  = var.sns_email
}
