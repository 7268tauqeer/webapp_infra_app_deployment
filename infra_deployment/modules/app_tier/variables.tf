variable "public_subnet_a" {
  description = "The public subnet a id"
  type        = "string"
}

variable "public_subnet_b" {
  description = "The public subnet b id"
  type        = "string"
}

variable "private_subnet_a" {
  description = "The private subnet a id"
  type        = "string"
}

variable "private_subnet_b" {
  description = "The private subnet b id"
  type        = "string"
}

variable "public_sg" {
  description = "The public security group id"
  type        = "string"
}

variable "private_sg" {
  description = "The private security group id"
  type        = "string"
}

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

