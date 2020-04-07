resource "aws_lb" "nlb" {
  name               = "propitix-nlb"
  internal           = false
  load_balancer_type = "network"
  subnets            = [aws_subnet.public-1.id, aws_subnet.public-2.id]

  enable_deletion_protection = false

  tags = {
        "Name"           = "propitix-nlb",
        "Managed By"     = "Terraform",
        "Resource"       = "NLB",
        "Project"        = "Propitix"
    }
}