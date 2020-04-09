resource "aws_launch_template" "webserver" {
  name = "webserver"
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

  image_id = "ami-006a0174c6c25ac06"

  key_name = aws_key_pair.deployer-darey.key_name

  # instance_initiated_shutdown_behavior = "stop"

  instance_market_options {
    market_type = "spot"
  }
  instance_type = "t2.micro"
  monitoring {
    enabled = true
  }
  network_interfaces {
    associate_public_ip_address = false
    subnet_id = aws_subnet.private-1.id
    security_groups = [aws_security_group.private-http.id,aws_security_group.private-ssh.id ]
  }
  placement {
    availability_zone = "eu-west-2a"
  }

  tag_specifications {
    resource_type = "instance"
  tags = {
        "Name"           = "webserver-launch-template",
        "Managed By"     = "Terraform",
        "Resource"       = "LaunchTemplate",
        "Project"        = "Propitix"
    }
  }
  user_data = filebase64("${path.module}/launch-template.sh")
}