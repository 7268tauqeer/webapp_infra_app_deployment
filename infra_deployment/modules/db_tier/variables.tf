variable "db_subnet_a" {
  description = "db_subnet_a"
}

variable "db_subnet_b" {
  description = "db_subnet_b"
}

variable "db_security_group" {
  description = "db_security_group"
}

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