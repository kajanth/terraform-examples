resource "aws_instance" "ec2_instance" {
        ami = "${var.aws_ami}"
        instance_type = "${var.ec2_instance_type}"
        vpc_security_group_ids = ["${var.security_group_id}"]
        subnet_id = "${var.subnet_id}"
        associate_public_ip_address = true
        count = "${var.instance_count}"
        #key_name = "${var.aws_keypair}"
        user_data = "${file("userdata.sh")}"

        tags {
          Name        = "${var.name}"
          Environment = "${var.environment}"
          Owner = "${var.owner}"
        }

}
