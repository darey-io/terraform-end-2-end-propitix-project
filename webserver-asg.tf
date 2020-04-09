# Autoscaling group
resource "aws_autoscaling_group" "webserver_asc" {

  name_prefix                 = "webserver"
  desired_capacity            = 5
  max_size                    = 10
  min_size                    = 2
  wait_for_capacity_timeout   = 0
  health_check_type           = "EC2"
  vpc_zone_identifier       = [aws_subnet.private-1.id, aws_subnet.private-2.id]
  target_group_arns           = [aws_alb_target_group.propitix_http_tg.arn]
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


# Scaling Policy 
resource "aws_autoscaling_policy" "cpuPolicy" {
  name                   = "cpu-scaling-policy"
  adjustment_type        = "ChangeInCapacity"
  policy_type            = "TargetTrackingScaling"
  autoscaling_group_name = aws_autoscaling_group.webserver_asc.name

  target_tracking_configuration {
  predefined_metric_specification {
    predefined_metric_type = "ASGAverageCPUUtilization"
  }

  target_value = 90.0
}

}
