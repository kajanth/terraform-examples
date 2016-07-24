resource "aws_security_group" "vpc" {
    name = "tools"
    description = "tools security group"
    vpc_id      = "${aws_vpc.vpc.id}"

    ingress {
        from_port       = 22
        to_port         = 22
        protocol        = "tcp"
        cidr_blocks = ["${split(",", var.security_group_ingress_cidr_blocks)}"]
    }

    ingress {
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        cidr_blocks = ["${split(",", var.security_group_ingress_cidr_blocks)}"]
    }


    egress {
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    tags {
        Name        = "${var.name}-security-group"
        Environment = "${var.environment}"
        Owner = "${var.owner}"
    }

}
