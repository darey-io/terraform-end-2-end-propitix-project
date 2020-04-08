
# Route Table For Private Subnet 1
resource "aws_route_table" "private-1-rtb" {
  vpc_id                  = aws_vpc.propitix_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.gw1.id
  }


  tags = {
        "Name"           = "private-1-route-table",
        "Managed By"     = "Terraform",
        "Resource"       = "Route Table",
        "Project"        = "Propitix"
    }
}

# Route Table Association For Private Subnet 1 
resource "aws_route_table_association" "private-1-rta" {
  subnet_id      = aws_subnet.private-1.id
  route_table_id = aws_route_table.private-1-rtb.id
}


# Route Table For Private Subnet 2
resource "aws_route_table" "private-2-rtb" {
  vpc_id                  = aws_vpc.propitix_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.gw2.id
  }

  tags = {
        "Name"           = "private-2-route-table",
        "Managed By"     = "Terraform",
        "Resource"       = "Route Table",
        "Project"        = "Propitix"
    }
}

# Route Table Association For Private Subnet 2
resource "aws_route_table_association" "private-2-rta" {
  subnet_id      = aws_subnet.private-2.id
  route_table_id = aws_route_table.private-2-rtb.id
}
