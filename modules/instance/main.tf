resource "aws_instance" "aws_instance_module" {
  instance_type               = "${var.instance_type}"
  ami                         = "${var.instance_ami}"
  subnet_id                   = "${var.instance_subnet_id}"
  security_groups             = ["${var.instance_security_groups}"]
  associate_public_ip_address = "${var.instance_public_ip}"
  key_name                    = "${var.instance_key_name}"
  monitoring                  = "${var.instance_monitoring}"

  root_block_device {
    delete_on_termination = true
    volume_size           = "${var.block_volume_size}"
    volume_type           = "${var.block_volume_type}"
  }

  tags = "${var.tags}"
}

output "instance_public_ip" {
  value = "${aws_instance.aws_instance_module.public_ip}"
}
