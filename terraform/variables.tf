variable "aws_access_key" {
  default     = "<AWS-ACCESS_KEY>"
  description = "aws access key"
}

variable "aws_secret_key" {
  default     = "<AWS-SECRET-KEY>"
  description = "aws secret key"
}

variable "aws_region" {
  default     = "us-west-1"
  description = "AWS region"
}

# VPC Variables
variable "vpc_name" {
  default     = "my-vpc"
  description = "Name for the VPC"
}

variable "igw_name" {
  default     = "my-igw"
  description = "Name for the Internet Gateway"
}

variable "route_table_name" {
  default     = "my-routetable"
  description = "Name for the Route Table"
}

variable "subnet_name" {
  default     = "my-subnet"
  description = "Name for the Subnet"
}

variable "subnet_cidr_block" {
  default     = "10.0.1.0/24"
  description = "CIDR block for the Subnet"
}

variable "vpc_cidr_block" {
  default     = "10.0.0.0/16"
  description = "CIDR block for the VPC"
}

# EC2 Variables
variable "ami_id" {
  default     = "ami-0c94855ba95c71c99"
  description = "AMI ID for the EC2 instance"
}

variable "instance_type" {
  default     = "t2.micro"
  description = "Instance type"
}

variable "key_pair_name" {
  description = "Key pair name"
  default     = "my-key-pair"
}

variable "sg_name" {
  default     = "my-security-group"
  description = "Name for the Security Group"
}

variable "instance_name" {
  default     = "my-instance"
  description = "Name for the EC2 Instance"
}

variable "allowed_ssh_cidr" {
  default     = ["0.0.0.0/0"]
  description = "Allowed CIDR block for SSH access"
}

variable "volume_size" {
  default     = 50
  description = "Root volume size in GB"
}

