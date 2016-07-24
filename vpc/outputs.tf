output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "security_group_id" {
  value = "${aws_security_group.vpc.id}"
}

output "public_subnets" {
  value = "${join(",", aws_subnet.public.*.id)}"
}
