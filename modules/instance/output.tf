output "new_instance_public_ip" {
  value = "${aws_instance.aws_instance_module.public_ip}"
}
