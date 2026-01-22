provider "aws" {
  region = "us-east-1"  
}

data "aws_security_group" "existing_sg" {
  id     = "sg-00a4b4c5b02bc5c56"  
}

data "aws_iam_instance_profile" "ssm_profile" {
  name   = "ssm-role"  
}

module "ec2_nginx" {
  source = "../modules/ec2-nginx"  

  ami                       = "ami-0fc5d935ebf8bc3bc"
  instance_type             = "t2.micro"
  instance_name             = "kunwar-prod-nginx"
  environment               = "prod"
  iam_instance_profile      = data.aws_iam_instance_profile.ssm_profile.name
  vpc_security_group_ids    = [data.aws_security_group.existing_sg.id]


  prevent_destroy           = true
}