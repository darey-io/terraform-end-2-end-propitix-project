# Autoscaling group
resource "aws_autoscaling_group" "bastion_asc" {

  name_prefix                 = "bastion"
  desired_capacity            = 1
  max_size                    = 2
  min_size                    = 1
  wait_for_capacity_timeout   = 0
  availability_zones          = ["eu-west-2a"]
  health_check_type           = "EC2"

  launch_template {
                      id      = aws_launch_template.bastion.id
                      version = "$Latest"
  }

tags = concat(
  [
    {
      "key" = "Name"
      "value" = "bastion-asg"
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

