variable "cidr_block" {
  type        = string
  description = "The CIDR block for the VPC"
}

variable "vpc_name" {
  type        = string
  description = "The name of the VPC"
}

variable "igw_name" {
  type        = string
  description = "The name of the Internet Gateway"
}

variable "route_table_name" {
  type        = string
  description = "The name of the Route Table"
}

variable "subnet_cidr_block" {
  type        = string
  description = "The CIDR block for the Subnet"
}

variable "subnet_name" {
  type        = string
  description = "The name of the Subnet"
}

