resource "aws_s3_bucket" "financedata_bucket001" {
  bucket = "financedata-bucket001"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}