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


1. Launch Template (Bastion and Webservers)
2. Auto Scaling Groups (Bastion and Webservers)
3. Key-Pair 
4. NLB Listener (Bastion)
5. NLB-Target Groups (Bastion)
6. ALB Listener (Webserver)
7. ALB-Target Groups (Webserver)
8. ASG Scaling Policies (Bastion and webserver)


TODO 

# Ensure there is more than 1 subnets for the launch templates
# Use remote state
# Explore workspaces
# Centralise variables 
# Use of count for ASG nodes
# Launch Templates changes do not take immediate effect on EC2 except there is need for the ASG to read the template and apply the change.
# Dependency cycle between listener and target group
# Update the Application Load balancer to use SSL
# Add SNS notifications to ASG
# Rename nlb file in 1-network branch
# Interpolate efs domain name output into the launch template shell script
# Configure propitix software to be deployed 
# Configure Route 53
# Configure S3 buckets
# Configure Cloudfront




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

3. Using the count to create 2 EFS mount targets without repeating code.

URGENT 
1. update 1-network branch with launch templates (Except efs security group should not go in)


TRAPS

1. Disable DNS hostname resolution on VPC so that EFS will not easily be mounted on instances 