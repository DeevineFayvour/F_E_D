#variables.tf
variable "vpc_cidr_block" {
 type = string
 description = "To set cidr for vpc"
}

variable "route_cidr_block" {
 type = string
 description = "To set cidr for route_table"
}

variable "private_subnet_cidr_block1" {
 type = string
 description = "To set cidr for subnet"
}

variable "private_subnet_cidr_block2" {
 type = string
 description = "To set cidr for subnet"
}

variable "public_subnet_cidr_block1" {
 type = string
 description = "To set cidr for subnet"
}

variable "public_subnet_cidr_block2" {
 type = string
 description = "To set cidr for subnet"
}

variable "availability_zone1" {
 type = string
 description = "To set AWS availability region"
}

variable "availability_zone2" {
 type = string
 description = "To set AWS availability region"
}

variable "env_prefix" {
 type = string
 description = "Set as dev or prod or qa etc. based on desired environment"
}

variable "core_network_arn" {
  type = string
}
