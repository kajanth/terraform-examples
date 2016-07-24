# General variables.
variable "name" {
  default = "example"
}

variable "owner" {
  default = "pbailey"
}

variable "environment" {
  default = "dev"
}

#EC2 specific variables.

variable "security_group_id" {
  description = "Security group to associate to the instance."
  default = ""
}

variable "subnet_id" {
  description = "Public subnet where to laucnh the EC2 instance."
  default = ""
}

#t2.nano,t2.micro,t2.small
variable "ec2_instance_type" {
  description = "AWS instance type."
  default = "t2.nano"
}

variable "aws_ami" {
  description = "AWS ami to be launched."
  default ="ami-ed82e39e"

}

variable "instance_count" {
  description = "Number of instances to be launched."
  default ="2"
}


variable "aws_keypair" {
  description = "AWS ssh keypair."
  default = "phillip"
}
