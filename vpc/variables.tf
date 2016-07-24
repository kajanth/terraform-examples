variable "name" {
  default = "example"
}

variable "owner" {
  default = "pbailey"
}

variable "environment" {
  default = "dev"
}

variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "external_access_cidr_block" {
  default = "0.0.0.0/0"
}

#security_group_ingress_cidr_blocks must be passed with
#comma separated value. i.e, ""<youroffice/homeipaddress>/netmask"
#!!! 0.0.0.0/0 be aware 0.0.0.0/0 open the vpc to the world.
variable "security_group_ingress_cidr_blocks" {
  default = "0.0.0.0/0"
}

variable "public_subnet_cidr_blocks" {
  default = "10.0.0.0/24,10.0.2.0/24,10.0.3.0/24"
}

variable "availability_zones" {
  default = "eu-west-1a,eu-west-1b,eu-west-1b"
}
