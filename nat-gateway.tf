# Configure NAT Gateway for the first Availability Zone

resource "aws_eip" "nat_gw_eip-1" {
  vpc                    = true
  tags = {
        "Name"           = "public-1-natgw-eip",
        "Managed By"     = "Terraform",
        "Resource"       = "EIP",
        "Project"        = "Propitix"
    }
}


resource "aws_nat_gateway" "gw1" {
  allocation_id          = aws_eip.nat_gw_eip-1.id
  subnet_id              =    aws_subnet.public-1.id

  tags = {
        "Name"           = "public-1-igw",
        "Managed By"     = "Terraform",
        "Resource"       = "NGW",
        "Project"        = "Propitix"
    }

}


# Configure NAT Gateway for the Second Availability Zone

resource "aws_eip" "nat_gw_eip-2" {
  vpc                    = true
  tags = {
        "Name"           = "public-2-natgw-eip",
        "Managed By"     = "Terraform",
        "Resource"       = "EIP",
        "Project"        = "Propitix"
    }
}


resource "aws_nat_gateway" "gw2" {
  allocation_id          = aws_eip.nat_gw_eip-2.id
  subnet_id              =    aws_subnet.public-2.id

  tags = {
        "Name"           = "public-2-igw",
        "Managed By"     = "Terraform",
        "Resource"       = "NGW",
        "Project"        = "Propitix"
    }

}