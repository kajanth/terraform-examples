
output "Instances ID" {
    value = "${join(",", aws_instance.ec2_instance.*.id)}"
}

output "Instances public ip addresses" {
    value = "${join(",", aws_instance.ec2_instance.*.public_ip)}"
}
