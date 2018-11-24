resource "aws_vpc" "main" {
  cidr_block = "${var.vpc_cidr_block}"

  tags {
    Name = "hashistack-vpc"
  }
}

resource "aws_internet_gateway" "public" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "${var.internet_gateway_name}"
  }
}

resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "${var.route_table_name}"
  }
}

resource "aws_route" "public" {
  route_table_id         = "${aws_route_table.public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.public.id}"
  depends_on             = ["aws_route_table.public"]
}

resource "aws_route_table_association" "public" {
  subnet_id      = "${aws_subnet.main.id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_security_group" "main" {
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "hashistack-security-group"
  }

  vpc_id = "${aws_vpc.main.id}"
}

resource "aws_subnet" "main" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.public_subnet_cidr_block}"

  tags {
    Name = "hashistack-public-subnet"
  }
}

output "aws_vpc_id" {
  value = "${aws_vpc.main.id}"
}

output "aws_security_group_id" {
  value = "${aws_security_group.main.id}"
}

output "aws_subnet_id" {
  value = "${aws_subnet.main.id}"
}
