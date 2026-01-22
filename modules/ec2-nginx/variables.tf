variable "ami" {
  type = string  
}

variable "instance_type" {
  type = string  
}

variable "instance_name" {
  type = string  
}

variable "environment" {
  type = string  
}

variable "iam_instance_profile" {
  type = string 
}

variable "vpc_security_group_ids" {
  type = list(string)  
}

variable "prevent_destroy" {
  type    = bool
  default = true
}