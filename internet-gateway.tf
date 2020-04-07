# Internet Gateway
resource "aws_internet_gateway" "igw1" {
vpc_id      = aws_vpc.propitix_vpc.id
}


# Internet Gateway
resource "aws_internet_gateway" "igw2" {
vpc_id      = aws_vpc.propitix_vpc.id
}