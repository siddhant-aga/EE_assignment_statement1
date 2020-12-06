variable "aws_region" {
  default = "us-east-1"
}

variable "ami" {
  default = "ami-13be557e"
}

variable "public_key_path" {
  default = "mykey.pub"
}

variable "vpc_cidr" {
  default = "172.20.0.0/16"
}

variable "public_subnet_cidr" {
  default = "172.20.10.0/24"
}

variable "private_subnet_cidr" {
  default = "172.20.20.0/24"
}

