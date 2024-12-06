# VPC Module Outputs
output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "The ID of the VPC"
}

output "subnet_id" {
  value       = module.vpc.subnet_id
  description = "The ID of the subnet"
}

output "route_table_id" {
  value       = module.vpc.route_table_id
  description = "The ID of the route table"
}

output "igw_id" {
  value       = module.vpc.igw_id
  description = "The ID of the internet gateway"
}

output "instance_id" {
  value       = module.ec2.instance_id
  description = "The ID of the EC2 instance"
}

output "public_ip" {
  value       = module.ec2.public_ip
  description = "The public IP address of the EC2 instance"
}
