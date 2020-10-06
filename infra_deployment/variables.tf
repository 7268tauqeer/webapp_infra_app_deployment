variable "aws_region" {}
variable "aws_profile" {}

variable "vpc_cidr" {
  description = "The cidr range for vpc"
  type        = "string"
}

variable "public_subnet_a_cidr" {
  description = "The cidr range for public subnet a"
  type        = "string"
}

variable "public_subnet_b_cidr" {
  description = "The cidr range for public subnet b"
  type        = "string"
}

variable "private_subnet_a_cidr" {
  description = "The cidr range for private subnet a"
  type        = "string"
}

variable "private_subnet_b_cidr" {
  description = "The cidr range for private subnet b"
  type        = "string"
}

variable "db_subnet_a_cidr" {
  description = "The cidr range for db subnet a"
  type        = "string"
}

variable "db_subnet_b_cidr" {
  description = "The cidr range for db subnet b"
  type        = "string"
}


#============================================================================================================
variable "ami_id" {
  description = "AMI id for the AS config"
  type        = "string"
}

variable "instance_size" {
  description = "Instance Size for the AS config"
  type        = "string"
}

variable "min_size" {
  description = "Min size for the ASG"
  type        = number
}

variable "max_size" {
  description = "Max Size for the AS config"
  type        = number
}


#===============================================================================================================

variable "username" {
  description = "RDS username"
}

variable "password" {
  description = "RDS password"
}

variable "db_instance_size" {
  description = "RDS instance size"
}

variable "multi_az" {
  description = "Create a replica in different zone if set to true"
}

variable "allocated_storage" {
  description = "The amount of allocated storage"
}

variable "skip_final_snapshot" {
  description = "Creates a snapshot when db is deleted if set to true"
}