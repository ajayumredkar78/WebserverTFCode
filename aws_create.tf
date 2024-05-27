resource "aws_vpc" "demo_vpc" {
  cidr_block = "10.0.0.0/16" # Replace with your desired CIDR block
  tags = {
    Name = "Prod_VPC"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.demo_vpc.id
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.demo_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "prod-RT"
  }
}

resource "aws_route_table_association" "route_table_asso" {
  subnet_id      = aws_subnet.my_subnet.id
  route_table_id = aws_route_table.route_table.id
}


