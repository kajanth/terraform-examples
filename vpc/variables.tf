
variable "name" {
  default = "example"
}

variable "owner" {
  default = "pbailey"
}

variable "environment" {
  default = "dev"
}

#security_group_ingress_cidr_blocks must be passed with
#comma separated value. i.e, ""<youroffice/homeipaddress>/netmask"
#!!! 0.0.0.0/0 be aware 0.0.0.0/0 open the vpc to the world
variable "security_group_ingress_cidr_blocks" {
  description = "cidr blocks must be , delimited"
  type = "list"
  default =  ["0.0.0.0/0"]
}

variable "cidr_block" {
  description = "CIDR block for the whole VPC"
  default = "10.0.0.0/16"
}

variable "route_table_cidr" {
  description = "The CIDR block of the route."
  default = "0.0.0.0/0"
}

variable "amount_subnets" {
  description = "Amount of subnets required"
  default = "3"
}

variable "subnets" {
  description = "Availability zones"
  default = {
    "0" = "a"
    "1" = "b"
    "2" = "c"
  }
}

variable "subnets_cidr_block" {
  description = "Subnets that you need, this needs to be , delimited"
  type = "list"
  default =  ["10.0.0.0/24","10.0.1.0/24","10.0.2.0/24"]
}
