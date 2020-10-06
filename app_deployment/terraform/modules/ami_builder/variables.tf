
variable "key_name" {
  description = "ssh key name"
  type        = "string"
}

variable "public_key_path" {}

variable "private_key_path" {}

variable "rds_endpoint" {
  description = "RDS endpoint"
  type        = "string"
}

variable "instance_size" {
  description = "EC2 instance size"
  type        = "string"
}

variable "subnet_id" {
  description = "Subnet id to which EC2 instance need to be deployed"
  type        = "string"
}


variable "security_group_id" {
  description = "SG id which needs to be attached to EC2 instance"
  type        = "string"
}

