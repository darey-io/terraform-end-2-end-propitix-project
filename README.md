# terraform-end-2-end-propitix-project


SEQUENCE 

Branch - 1-Networks

1. Provider 
2. VPC 
3. Internet Gateway 
4. Public Subnets 
5. Private Subnets
6. Nat gateways
7. Routes/Route Table Associations
8. NLB 
9. Security Groups 
10. Route Table
11. Route Table Associations with Subnet


Branch - 2-Compute


1. Launch Template (Bastion)
2. Launch Template (webserver)
3. Auto Scaling Groups 
4. Key-Pair 
5. NLB Listener
6. NLB-Target Groups


TODO 

1. Ensure there is more than 1 subnets for the launch templates
2. Use remote state
3. Explore workspaces
4. Centralise variables 
5. Use of count for ASG nodes
6. Launch Templates changes do not take immediate effect on EC2 except there is need for the ASG to read the template and apply the change.
7. Dependency cycle between listener and target group



Refactor opportunities

1. Merge sharable tags with locals 
  tags = {
    "Managed By" = "Terraform"
  }

2. Using count and splat for subnets [aws_subnet.public.*.id]

Variables to be created 

# Provider
1. Variable for Region 

# VPC 
1. Variable for VPC name 
2. Variable for VPC cidr

