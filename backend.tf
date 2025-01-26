terraform {
    backend "s3" {
        bucket = "zamacraig-terraform-backend"
        key = "terraform/terraform.tfstate"
        region = "us-east-1"
    }
}