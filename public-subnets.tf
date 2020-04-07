# Public Subnet 1
resource "aws_subnet" "public-1" {
  vpc_id                  = aws_vpc.propitix_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "eu-west-2a"
  depends_on              = [
      aws_internet_gateway.igw1
  ]
  tags = {
    "Name"           = "public-1",
    "Managed By" = "Terraform",
    "Resource" = "public-subnet",
    "Project" = "Propitix"
  }
}


# Public Subnet 2
resource "aws_subnet" "public-2" {
  vpc_id                  = aws_vpc.propitix_vpc.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "eu-west-2b"
  depends_on              = [
      aws_internet_gateway.igw2
  ]
  tags = {
    "Name"           = "public-2",
    "Managed By"     = "Terraform",
    "Resource"       = "public-subnet",
    "Project"        = "Propitix"
  }
}
