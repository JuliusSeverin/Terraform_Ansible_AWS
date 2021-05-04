
resource "aws_lb" "nlb_ansk8jul" {
  
  name               = "kubernetes"
  internal           = false
  load_balancer_type = "network"
  subnets            = var.subnets

  enable_deletion_protection = false

  tags = {
    Name = "nlb_ansk8jul"
  }
}

resource "aws_lb_listener" "listener_nlb_ansk8jul" {
  
  load_balancer_arn = aws_lb.nlb_ansk8jul.arn
  port              = "443"
  protocol          = "TCP"
  #certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"
  #alpn_policy       = "HTTP2Preferred"  # uncomment certificate_arn & alpn_policy if TLS

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_nlb_ansk8jul.arn
  }
}


resource "aws_lb_target_group" "tg_nlb_ansk8jul" {
  
  name        = "kubernetes"
  port        = 6443
  protocol    = "TCP"
  target_type = "ip"
  vpc_id      = var.vpc_id
}

resource "aws_lb_target_group_attachment" "lb_targt_gr_attach" {
  
  target_group_arn = aws_lb_target_group.tg_nlb_ansk8jul.arn
  target_id        = var.target_id 
  port             = "6443"

}
