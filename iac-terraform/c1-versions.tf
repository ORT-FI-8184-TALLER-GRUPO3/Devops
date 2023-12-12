# Terraform Block
terraform {
  required_version = "~> 1.6"
  required_providers {
    aws = { 
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

# Adding Backend as S3 for Remote State Storage with State Locking
  backend "s3" {
    bucket = "rafa-terraform-devopslab"
    key    = "dev2/terraform.tfstate"
    region = "us-east-1"

    # For State Locking
    #dynamodb_table = "terraform-dev-state-table"
  }
# Fin Adding Backend for Remote Statye Storage
}

# Provider Block
provider "aws" {
  region = "us-east-1"
  profile = "default"
}
