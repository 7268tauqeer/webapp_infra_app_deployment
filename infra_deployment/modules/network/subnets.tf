# ------------------------------------------------------------------------------
# PUBLIC SUBNETS
# ------------------------------------------------------------------------------

resource "aws_subnet" "public_subnet_a" {
  vpc_id                  = "${aws_vpc.test_vpc.id}"
  cidr_block              = "${var.public_subnet_a_cidr}"
  availability_zone       = "ap-southeast-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-a"
  }
}

resource "aws_subnet" "public_subnet_b" {
  vpc_id                  = "${aws_vpc.test_vpc.id}"
  cidr_block              = "${var.public_subnet_b_cidr}"
  availability_zone       = "ap-southeast-2b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-b"
  }
}

# ------------------------------------------------------------------------------
# PRIVATE SUBNETS
# ------------------------------------------------------------------------------

resource "aws_subnet" "private_subnet_a" {
  vpc_id                  = "${aws_vpc.test_vpc.id}"
  cidr_block              = "${var.private_subnet_a_cidr}"
  availability_zone       = "ap-southeast-2a"
  map_public_ip_on_launch = false

  tags = {
    Name = "private-subnet-a"
  }
}

resource "aws_subnet" "private_subnet_b" {
  vpc_id                  = "${aws_vpc.test_vpc.id}"
  cidr_block              = "${var.private_subnet_b_cidr}"
  availability_zone       = "ap-southeast-2b"
  map_public_ip_on_launch = false

  tags = {
    Name = "private-subnet-b"
  }
}

resource "aws_subnet" "db_subnet_a" {
  vpc_id                  = "${aws_vpc.test_vpc.id}"
  cidr_block              = "${var.db_subnet_a_cidr}"
  availability_zone       = "ap-southeast-2a"
  map_public_ip_on_launch = false

  tags = {
    Name = "db-subnet-a"
  }
}

resource "aws_subnet" "db_subnet_b" {
  vpc_id                  = "${aws_vpc.test_vpc.id}"
  cidr_block              = "${var.db_subnet_b_cidr}"
  availability_zone       = "ap-southeast-2b"
  map_public_ip_on_launch = false

  tags = {
    Name = "db-subnet-b"
  }
}
