# Internet Gateway
resource "aws_internet_gateway" "igw" {
vpc_id      = aws_vpc.propitix_vpc.id
}
