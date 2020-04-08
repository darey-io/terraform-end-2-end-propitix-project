resource "aws_lb_target_group" "ssh-tg" {
  name     = "bastion-tg-group"
  port     = 22
  protocol = "TCP"
  vpc_id   = aws_vpc.propitix_vpc.id
}