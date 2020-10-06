# ------------------------------------------------------------------------------
# PUBLIC ROUTE TABLES
# ------------------------------------------------------------------------------

resource "aws_route_table" "public_route_table" {
  vpc_id = "${aws_vpc.test_vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table_association" "public_route_a" {
  subnet_id      = "${aws_subnet.public_subnet_a.id}"
  route_table_id = "${aws_route_table.public_route_table.id}"
}

resource "aws_route_table_association" "public_route_b" {
  subnet_id      = "${aws_subnet.public_subnet_b.id}"
  route_table_id = "${aws_route_table.public_route_table.id}"
}

# ------------------------------------------------------------------------------
# PRIVATE ROUTE TABLES
# ------------------------------------------------------------------------------

resource "aws_route_table" "private_route_table_a" {
  vpc_id = "${aws_vpc.test_vpc.id}"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.nat_gw_a.id}"
  }

  tags = {
    Name = "private-route-table"
  }
}

resource "aws_route_table_association" "private_a" {
  subnet_id      = "${aws_subnet.private_subnet_a.id}"
  route_table_id = "${aws_route_table.private_route_table_a.id}"
}

resource "aws_route_table" "private_route_table_b" {
  vpc_id = "${aws_vpc.test_vpc.id}"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.nat_gw_b.id}"
  }

  tags = {
    Name = "private-route-table"
  }
}

resource "aws_route_table_association" "private_b" {
  subnet_id      = "${aws_subnet.private_subnet_b.id}"
  route_table_id = "${aws_route_table.private_route_table_b.id}"
}