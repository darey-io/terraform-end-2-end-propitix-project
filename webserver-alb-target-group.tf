resource "aws_alb_target_group" "propitix_http_tg" {
  name     = "propitix-http-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.propitix_vpc.id
}
