# Autoscaling group
resource "aws_autoscaling_group" "webserver_asc" {

  name_prefix                 = "webserver"
  desired_capacity            = 3
  max_size                    = 5
  min_size                    = 2
  wait_for_capacity_timeout   = 0
  availability_zones          = ["eu-west-2a"]
  health_check_type           = "EC2"
  vpc_zone_identifier       = [aws_subnet.private-1.id, aws_subnet.private-2.id]
  # target_group_arns           = [aws_lb_target_group.ssh-tg.arn]
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


