terraform {
  backend "s3" {
    bucket                  = "kunwar-terraform-state-bucket"
    key                     = "dev/ec2-nginx/terraform.tfstate"
    region                  = "us-east-1"
    dynamodb_table          = "terraform-locks"
    encrypt                 = true
  }  
}
