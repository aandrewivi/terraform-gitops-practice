# Region definition
variable "region" {
  description = "The AWS region to deploy the resources in"
  type        = string
  default     = "us-east-1"
}


# EC2 instance type definition
variable "instance_type" {
  description = "The type of EC2 instance to create"
  type        = string
  default     = "t2.micro"
}


# ami id definition
variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
  default     = "ami-084568db4383264d4" # Ubuntu AMI
}


# subnet CIDR block definition
variable "subnet_cidr_block" {
  description = "The CIDR block for the subnet"
  type        = string
  default     = "10.0.1.0/24"
}


# security group ingreess rule definition
variable "security_group_ingress_description" {
  description = "The description of the security group"
  type        = string
  default     = 22
}

# security group cidr block definition
variable "security_group_cidr_block" {
  description = "The CIDR block for the security group"
  type        = string
  default     = "0.0.0.0/0"
}

variable "region" {}
variable "access_key" {}
variable "secret_key" {}

