# ------------------------------------------------------------------------------
# CONFIGURE OUR AWS CONNECTION
# ------------------------------------------------------------------------------

provider "aws" {
  region = var.aws_region
  profile= var.aws_profile
}

terraform {
  backend "s3" {}
}

# ------------------------------------------------------------------------------
# RUNNING MODULES
# ------------------------------------------------------------------------------

module "network" {
  source                = "./modules/network"
  vpc_cidr              = "${var.vpc_cidr}"
  public_subnet_a_cidr  = "${var.public_subnet_a_cidr}"
  public_subnet_b_cidr  = "${var.public_subnet_b_cidr}"
  private_subnet_a_cidr = "${var.private_subnet_a_cidr}"
  private_subnet_b_cidr = "${var.private_subnet_b_cidr}"
  db_subnet_a_cidr      = "${var.db_subnet_a_cidr}"
  db_subnet_b_cidr      = "${var.db_subnet_b_cidr}"
}


module "app_tier" {
  source           = "./modules/app_tier"
  ami_id           = var.ami_id
  instance_size    = var.instance_size
  min_size         = var.min_size
  max_size         = var.max_size
  
  public_subnet_a  = "${module.network.public_subnet_a}"
  public_subnet_b  = "${module.network.public_subnet_b}"
  private_subnet_a = "${module.network.private_subnet_a}"
  private_subnet_b = "${module.network.private_subnet_b}"
  public_sg        = "${module.network.public_sg}"
  private_sg       = "${module.network.private_sg}"
}

module "db_tier" {
  source              = "./modules/db_tier"
  db_subnet_a        = "${module.network.db_subnet_a}"
  db_subnet_b         = "${module.network.db_subnet_b}"
  db_security_group   = "${module.network.private_sg}"
  username            = "${var.username}"
  password            = "${var.password}"
  db_instance_size    = "${var.db_instance_size}"
  multi_az            = "${var.multi_az}"
  allocated_storage   = "${var.allocated_storage}"
  skip_final_snapshot = "${var.skip_final_snapshot}"
}