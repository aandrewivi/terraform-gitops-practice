# vpc id
output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

# output "subnet_id" {
output "subnet_id" {
  description = "The ID of the subnet"
  value       = aws_subnet.main.id
  
}

# output "security_group_id" 
output "security_group_id" {
  description = "The ID of the security group"
  value       = aws_security_group.allow_ssh.id
  
}

# output public ip
output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.drift-lab-instance.public_ip
  
}

