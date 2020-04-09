resource "aws_alb" "propitix-frontend-alb" {
  name            = "propitix-frontend-alb"
  subnets         = [aws_subnet.private-1.id, aws_subnet.private-2.id]
  load_balancer_type = "application"
  tags = {
        "Name"           = "propitix-frontend-alb",
        "Managed By"     = "Terraform",
        "Resource"       = "ALB",
        "Project"        = "Propitix"
    }
}
