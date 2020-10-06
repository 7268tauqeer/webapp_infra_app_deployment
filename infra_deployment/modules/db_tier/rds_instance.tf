resource "aws_db_instance" "postgres_rds" {
  identifier             = "three-tier-architecture-rds"
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "5.7"
  name                   = "mydb"
  final_snapshot_identifier = false
  db_subnet_group_name   = "${aws_db_subnet_group.default.id}"
  vpc_security_group_ids = ["${var.db_security_group}"]
  instance_class         = "${var.db_instance_size}"
  multi_az               = "${var.multi_az}"
  allocated_storage      = "${var.allocated_storage}"
  username               = "${var.username}"
  password               = "${var.password}"
  skip_final_snapshot    = "${var.skip_final_snapshot}"
  
}

resource "aws_db_subnet_group" "default" {
  subnet_ids = ["${var.db_subnet_a}", "${var.db_subnet_b}"]
}