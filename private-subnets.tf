
##############
# Configure the private network 

# Private Subnet 1
resource "aws_subnet" "private-1" {
  vpc_id                  = aws_vpc.propitix_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "eu-west-2a"

  tags = {
        "Name"           = "private-1",
        "Managed By"     = "Terraform",
        "Resource"       = "private-subnet",
        "Project"        = "Propitix"
  }
}


# Private Subnet 2
resource "aws_subnet" "private-2" {
  vpc_id                  = aws_vpc.propitix_vpc.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = "eu-west-2b"

  tags = {
    "Name"           = "private-2",
    "Managed By"     = "Terraform",
    "Resource"       = "private-subnet",
    "Project"        = "Propitix"
  }
}