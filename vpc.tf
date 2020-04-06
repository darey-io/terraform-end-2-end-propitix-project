# VPC
resource "aws_vpc" "propitix_vpc" {
  cidr_block        = "10.0.0.0/16"
  instance_tenancy  = "default"
  tags = {
    "Name"           = "Propitix_vpc",
    "Managed By"    = "Terraform",
    "Resource"      = "VPC",
    "Project"       = "Propitix"
  }
}


