
resource "aws_vpc" "vpc" {
  cidr_block           = "${var.cidr_block}"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags {
    Name        = "${var.name}-vpc"
    Environment = "${var.environment}"
    Owner = "${var.owner}"

  }
}

resource "aws_internet_gateway" "vpc" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name        = "${var.name}-internet-gateway"
    Environment = "${var.environment}"
    Owner = "${var.owner}"
  }
}



resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.vpc.id}"
  }

  tags {
    Name        = "${var.name}-routetable"
    Environment = "${var.environment}"
    Owner = "${var.owner}"
  }
}



resource "aws_subnet" "public" {
  lifecycle {
    create_before_destroy = true
  }

  count = "${length(split(",", var.public_subnet_cidr_blocks))}"

  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${element(split(",", var.public_subnet_cidr_blocks), count.index)}"
  availability_zone       = "${element(split(",", var.availability_zones), count.index)}"
  map_public_ip_on_launch = true

  tags {
    Name        = "${var.name}-public-subnet"
    Environment = "${var.environment}"
    Owner = "${var.owner}"
  }
}


resource "aws_route_table_association" "public" {
  count = "${length(split(",", var.public_subnet_cidr_blocks))}"

  subnet_id      = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id = "${aws_route_table.public.id}"
}
