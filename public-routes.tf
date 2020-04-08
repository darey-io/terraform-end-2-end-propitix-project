
# Route Table For public Subnet 1
resource "aws_route_table" "public-1-rtb" {
  vpc_id                  = aws_vpc.propitix_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
        "Name"           = "public-1-route-table",
        "Managed By"     = "Terraform",
        "Resource"       = "Route Table",
        "Project"        = "Propitix"
    }
}

# Route Table Association For public Subnet 1 
resource "aws_route_table_association" "public-1-rta" {
  subnet_id      = aws_subnet.public-1.id
  route_table_id = aws_route_table.public-1-rtb.id
}

# Route Table Association For public Subnet 2
resource "aws_route_table_association" "public-2-rta" {
  subnet_id      = aws_subnet.public-2.id
  route_table_id = aws_route_table.public-1-rtb.id
}
