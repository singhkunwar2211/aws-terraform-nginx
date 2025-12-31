data "aws_security_group" "existing_sg" {
  id = "sg-00a4b4c5b02bc5c56"  
}

data "aws_iam_role" "ssm_role" {
  name = "ssm-role"  
}
data "aws_iam_instance_profile" "ssm_profile" {
  name = "ssm-role"  
}

resource "aws_instance" "nginx" {
  ami                      = "ami-0fc5d935ebf8bc3bc"
  instance_type            = var.instance_type
  iam_instance_profile     = data.aws_iam_instance_profile.ssm_profile.name
  vpc_security_group_ids   = [data.aws_security_group.existing_sg.id]

  user_data =  <<-EOF
               #!/bin/bash
               apt update -y
               apt install nginx -y
               systemctl enable nginx
               systemctl start nginx
               EOF

  tags = {
    Name = var.instance_name
  }
}
