


/*# application load balancer. Under construction.

resource "aws_alb" "alb_ansk8jul" {

  name               = "kubernetes"
  subnets            = var.subnets
  security_groups    = [var.security_groups]
  internal           = false
  load_balancer_type = "application"
  #enable_deletion_protection	=	false

  tags = {
    Name = "alb_ansk8jul"
  }
}
# ALB listener port 443
resource "aws_alb_listener" "listener_443" {

  load_balancer_arn = aws_alb.alb_ansk8jul.arn
  port              = "443"
  protocol          = "tcp"

  #ssl_policy        = "ELBSecurityPolicy-2016-08"
  #certificate_arn   = var.basecertarn

  default_action {
    target_group_arn = aws_alb_target_group.alb_target_gr.arn
    type             = "forward"
  }
}

# ALB target group port 6443

resource "aws_alb_target_group" "alb_target_gr" {

  name        = "kubernetes"
  port        = "6443"
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

}
# ALB target group attachment


resource "aws_lb_target_group_attachment" "alb_targt_gr_attach" {

  target_group_arn = aws_alb_target_group.alb_target_gr.arn
  target_id        = element(split(",", module.ec2control.contro_priv_ips_string), count.index)      #var.target_id.id   #var.target_id[*]
  port             = "6443"
}
*/
