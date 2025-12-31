terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws" # AWS translator so Terraform can talk to AWS
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}