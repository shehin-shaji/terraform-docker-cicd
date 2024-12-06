variable "ami_id" {
  type        = string
  description = "AMI ID for the instance"
}

variable "instance_type" {
  type        = string
  description = "Instance type"
}

variable "key_pair_name" {
  type        = string
  description = "Key pair name"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID"
}

variable "sg_name" {
  type        = string
  description = "Name of the Security Group"
}

variable "allowed_ssh_cidr" {
  type        = list(string)
  description = "Allowed CIDR block for SSH access"
}

variable "instance_name" {
  type        = string
  description = "Name of the EC2 instance"
}

variable "volume_size" {
  type        = number
  description = "Root volume size"
}

