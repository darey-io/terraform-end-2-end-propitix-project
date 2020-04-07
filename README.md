# terraform-end-2-end-propitix-project


SEQUENCE 

Branch - Networks

1. Provider 
2. VPC 
3. Internet Gateway 
4. Public Subnets 
5. Private Subnets
6. Nat gateways
7. Routes/Route Table Associations

Branch - Compute

1. NLB 
2. Securioty Groups 
3. Launch Template (Bastion)
4. Launch Template (webserver)

TODO 
1. Ensure there is more than 1 subnets for the launch templates




Refactor opportunities

1. Merge sharable tags with locals 
  tags = {
    "Managed By" = "Terraform"
  }

2. Using count and splat for subnets [aws_subnet.public.*.id]

Variables to be created 

#Provider
1. Region 

# VPC 
1. VPC name 
2. VPC cidr