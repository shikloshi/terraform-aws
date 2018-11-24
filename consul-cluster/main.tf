terraform {
  backend "s3" {
    bucket = ""
    key    = ""
    region = ""
  }
}

provider "aws" {}

module "consul_security_group" {}

module "consul_vpc" {}

module "consul_subnet" {}

module "consul_security_group" {}

module "consul_master_1" {
  source = "./modules/instance"

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
