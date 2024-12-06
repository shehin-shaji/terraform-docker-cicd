output "instance_id" {
  value = aws_instance.my_instance.id
  description = "The ID of the EC2 instance"
}

output "public_ip" {
  value = aws_instance.my_instance.public_ip
  description = "The public IP of the EC2 instance"
}

