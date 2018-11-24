# Instance variables
variable "instance_type" {
  default = "t2.micro"
}

variable "instance_public_ip" {
  default = true
}

variable "instance_key_name" {
  default = "shikloshi-aws"
}

variable "instance_monitoring" {
  default = "false"
}

variable "block_volume_size" {
  default = 8
}

variable "block_volume_type" {
  default = "standard"
}

variable "instance_ami" {
  default = "ami-0bb5806b2e825a199"
}

variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "region" {
  default = "us-west-2"
}

# Vpc variables
variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr_block" {
  default = "10.0.1.0/24"
}

variable "internet_gateway_name" {
  default = "hashistack-ig"
}

variable "route_table_name" {
  default = "hashistack-route-table"
}
