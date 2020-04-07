resource "aws_launch_template" "bastion" {
  name = "bastion"
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      volume_size = 20
    }
  }
  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  credit_specification {
    cpu_credits = "standard"
  }
# This refers to termination Protection
  disable_api_termination = true

  image_id = "ami-006a0174c6c25ac06"
  key_name = aws_key_pair.deployer-darey.key_name
  instance_initiated_shutdown_behavior = "stop"


  instance_type = "t2.micro"
  monitoring {
    enabled = true
  }
  network_interfaces {
    associate_public_ip_address = true
    subnet_id                   = aws_subnet.public-1.id
    security_groups = [aws_security_group.public-bastion.id]
  }
  placement {
    availability_zone = "eu-west-2a"   # We need to be able to handle multiple AZs
  }

  tag_specifications {
    resource_type = "instance"
  tags = {
        "Name"           = "bastion-launch-template",
        "Managed By"     = "Terraform",
        "Resource"       = "LaunchTemplate",
        "Project"        = "Propitix"
    }
  }
  user_data = filebase64("${path.module}/launch-template.sh")
}