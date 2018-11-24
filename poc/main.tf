terraform {
  backend "s3" {
    bucket = "shikloshi-terraform"
    key    = "hashistack/terraform.tfstate"
    region = "us-west-2"
  }
}

module "aws_vpc_module" {
  source                   = "../modules/vpc"
  public_subnet_cidr_block = "${var.public_subnet_cidr_block}"
  vpc_cidr_block           = "${var.vpc_cidr_block}"
  internet_gateway_name    = "${var.internet_gateway_name}"
  route_table_name         = "${var.route_table_name}"
}

module "aws_instance_module" {
  source = "../modules/instance"

  instance_type            = "t2.micro"
  instance_ami             = "${var.instance_ami}"
  instance_monitoring      = false
  instance_public_ip       = "${var.instance_public_ip}"
  instance_key_name        = "shikloshi-aws"
  instance_subnet_id       = "${module.aws_vpc_module.aws_subnet_id}"
  instance_security_groups = ["${module.aws_vpc_module.aws_security_group_id}"]

  block_volume_size = "${var.block_volume_size}"
  block_volume_type = "${var.block_volume_type}"

  tags {
    Name = "default-instance" # to change this to be configurable or auto generated on run
  }
}
