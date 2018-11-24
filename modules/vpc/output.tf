output "test_from_module" {
  value = "we are testing in within the module"
}

output "vpc_id" {
  value = "${aws_vpc.main.id}"
}
