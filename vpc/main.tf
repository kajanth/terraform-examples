
provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region = "${var.aws_region}"
}

#These variables are empty as passed from .tfvars file

variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}


# Create a VPC
resource "aws_vpc" "public" {
  cidr_block = "${var.cidr_block}"
  enable_dns_support = true
  enable_dns_hostnames = true

  tags {
      Name        = "${var.name}"
      Environment = "${var.environment}"
      Owner = "${var.owner}"
  }
}

# Create subnets
resource "aws_subnet" "public" {
  count = "${var.amount_subnets}"
  vpc_id = "${aws_vpc.public.id}"
  cidr_block = "${element(var.subnets_cidr_block, count.index)}"
  availability_zone = "${var.aws_region}${lookup(var.subnets, count.index)}"

  map_public_ip_on_launch = true

  tags {
      Name        = "${var.name}"
      Environment = "${var.environment}"
      Owner = "${var.owner}"
  }
}

# Create internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.public.id}"

  tags {
      Name        = "${var.name}"
      Environment = "${var.environment}"
      Owner = "${var.owner}"
  }
}

# Create route table
resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.public.id}"
  route {
    cidr_block = "${var.route_table_cidr}"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags {
      Name        = "${var.name}"
      Environment = "${var.environment}"
      Owner = "${var.owner}"
  }
}

# Associate route table to subnets
resource "aws_route_table_association" "public" {
  count = "${var.amount_subnets}"
  subnet_id = "${element(aws_subnet.public.*.id, count.index)}"
  route_table_id = "${aws_route_table.public.id}"
}
