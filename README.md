# Finance Data Collection Application
Welcome to the Finance Data Collection Application! 🚀 This application streamlines the process of collecting financial data from Yahoo Finance and populating it into Amazon S3 for storage and PostgreSQL for database management. It also includes Terraform configuration files to provision the necessary AWS infrastructure, making deployment straightforward and efficient.

## Features
- 📥 Data Retrieval: Fetch financial data in real time directly from Yahoo Finance.

- ☁️ Data Storage: Store raw and processed data securely in Amazon S3.

- 🛠️ Database Integration: Populate and organize data in PostgreSQL for easy querying and analysis.

- ⚙️ Infrastructure as Code (IaC): Use Terraform to provision AWS infrastructure, enabling a seamless setup process.

- 🔍 Scalable Workflows: Tailored for efficient and scalable data collection pipelines.

- 💡 Easy Customization: Flexibly configure collection parameters to suit your needs.

## Getting Started
Follow these steps to set up and start using the application:

## Prerequisites
Ensure you have the following:

- Python 3.9

- AWS CLI configured with access to your S3 bucket

- PostgreSQL database set up and accessible

- Terraform installed on your machine

- Yahoo Finance Library

## Installation
1. Clone the repository:

```bash
git clone https://github.com/zamacraig/Finance-Data-Collection-Application.git
```

2. Navigate to the project directory:

```bash
cd Finance-Data-Collection-Application
```

3. Install the dependencies:

```bash
pip install -r requirements.txt
```

## Infrastructure Setup
1. Navigate to the terraform/ directory:

```bash
cd terraform
```

2. Initialize Terraform:

```bash
terraform init
```

3. Apply the configuration to provision the AWS infrastructure:

```bash
terraform apply
```

3. Confirm the resources are successfully created in your AWS account.

## Application Usage
1. Configure your AWS credentials, PostgreSQL connection details, and data collection parameters in the config file.

2. Run the application:

```bash
python app.py
```

3. Monitor the pipeline as it fetches data from Yahoo Finance, uploads it to Amazon S3, and inserts it into your PostgreSQL database.

Contributing
We welcome contributions to improve this project! Feel free to open issues or submit pull requests.
