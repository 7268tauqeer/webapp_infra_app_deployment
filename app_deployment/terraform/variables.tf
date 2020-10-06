
variable "aws_region" {}
variable "aws_profile" {}

variable "public_key_path" {
  
}

variable "private_key_path" {}

variable "key_name" {
  description = "name of the ssh key"
  type        = "string"
}

variable "instance_size" {
  description = " Instance type"
  type        = "string"
}