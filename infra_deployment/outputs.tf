
output "elb_dns" {
  description = "Elastic Load Balancer DNS"
  value       = "${module.app_tier.elb_dns}"
}

output "rds_endpoint" {
  description = "RDS endpoint"
  value       = "${module.db_tier.rds_endpoint}"
}


output "public_subnet_a" {
  description = "RDS endpoint"
  value       = "${module.network.public_subnet_a}"
}

output "public_sg" {
  description = "public_sg"
  value       = "${module.network.public_sg}"
}

output "private_sg" {
  description = "private_sg"
  value       = "${module.network.private_sg}"
}
