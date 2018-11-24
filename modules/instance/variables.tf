variable "instance_type" {}
variable "instance_ami" {}
variable "instance_subnet_id" {}

variable "instance_security_groups" {
  type = "list"
}

variable "instance_public_ip" {}
variable "instance_key_name" {}
variable "instance_monitoring" {}
variable "block_volume_size" {}
variable "block_volume_type" {}

variable "tags" {
  type = "map"
}
