terraform {
  required_version = ">= 1.6.2"

  backend "s3" {
    bucket              = "tf-account-id"
    key                 = "dev-iaac-api-upload-s3.tfstate"
    region              = "us-east-1"    
    allowed_account_ids = ["account-id"]
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5"
    }
  }
}