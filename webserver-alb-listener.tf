resource "aws_alb_listener" "alb_listener" {
  load_balancer_arn = aws_alb.propitix-frontend-alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    target_group_arn = aws_alb_target_group.propitix_http_tg.arn
    type             = "forward"
  }
}
