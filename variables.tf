variable "vpc_cidr" {
    default = "10.0.0.0/16"
}

variable "public_finance_subnet_a_cidr" {
    default = "10.0.1.0/28"
}

variable "public_finance_subnet_b_cidr" {
    default = "10.0.2.0/28"
}

variable "private_finance_subnet_a_cidr" {
    default = "10.0.3.0/28"
}

variable "private_finance_subnet_b_cidr" {
    default = "10.0.4.0/28"
}

variable "internet_cidr" {
    default = "0.0.0.0/0"
}

variable "db_name" {
  default = "finance"
}

variable "db_user" {
  sensitive = true
}

variable "db_password" {
  sensitive = true
}

variable "db_port" {
  default = 443
}

variable "http_port" {
  default = 8080
}

variable "vpc_zone_1" {
  default = "us-east-1a"
}

variable "sns_servicename" {
  default = "com.amazonaws.us-east-1.sns"
}

variable "vpc_zone_2" {
  default = "us-east-1b"
}

variable "sns_email" {
  description = "SNS email subscription"
  sensitive = true
}