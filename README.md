# FinanceData
This repository contains Terraform scripts and code for setting up and managing an AWS infrastructure, including an RDS PostgreSQL database and a Lambda function for finance-related operations.

## Overview
The FinanceData project is designed to demonstrate how to use Terraform to provision and manage AWS resources. It includes configurations for an RDS PostgreSQL database, a Lambda function with an associated layer, and the necessary networking components such as VPCs and subnets.

## Architecture
The architecture of this project includes the following components:

VPC: Virtual Private Cloud to house all resources.

Subnets: Public and private subnets for isolation and security.

Security Groups: To control access to the RDS instance.

RDS: PostgreSQL database instance within a private subnet.

Lambda Function: Serverless function to interact with the RDS database.

IAM Roles: Roles and policies to grant necessary permissions.

## Setup
Prerequisites
Terraform installed

AWS account with proper permissions

AWS CLI configured with your credentials

Steps
Clone the repository:

sh
git clone https://github.com/zamacraig/FinanceData.git
cd FinanceData
Initialize Terraform:

sh
terraform init
Apply the Terraform configuration:

sh
terraform apply
Follow the prompts to input necessary variables:

DB name

DB username

DB password

## Usage

### Connect to the RDS Database
Retrieve the RDS endpoint from the AWS Management Console or Terraform output.

Use a PostgreSQL client (e.g., psql, pgAdmin) to connect to the database:

sh
psql -h <rds-endpoint> -U admin -d mydatabase

### Add Tables to the Database
Use the provided SQL script to create tables:

sql
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10, 2) NOT NULL
);
### Lambda Function
Deploy your Lambda function with the provided lambda.tf.

Ensure the function can access the RDS database by setting environment variables.

## Contributing
Contributions are welcome! Please open an issue or submit a pull request with your changes.

## License
This project is licensed under the MIT License. See the LICENSE file for details.
