# Autoscaling group
resource "aws_autoscaling_group" "webserver_asc" {

  name_prefix                 = "webserver"
  desired_capacity            = 3
  max_size                    = 5
  min_size                    = 2
  wait_for_capacity_timeout   = 0
  availability_zones          = ["eu-west-2a"]
  health_check_type           = "EC2"

  launch_template {
                      id      = aws_launch_template.webserver.id
                      version = "$Latest"
  }
tags = concat(
  [
    {
      "key" = "Name"
      "value" = "webserver-asg"
      "propagate_at_launch" = true
    },
    {
      "key" = "Managed By"
      "value" = "Terraform"
      "propagate_at_launch" = true
    },
    {
      "key" = "Resource"
      "value" = "AutoScaling"
      "propagate_at_launch" = false
    },
      {
      "key" = "Project"
      "value" = "Propitix"
      "propagate_at_launch" = true
    },
  ]
)
}


