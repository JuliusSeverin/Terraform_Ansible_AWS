output "load_balancer_arn" {
  description = "Application load balancer Amazon Resource Name (ARN)"
  value       = aws_lb.nlb_ansk8jul.arn
}

output "aws_lb_listener_arn" {
  description = "Application load balancer listener Amazon Resource Name (ARN)"
  value       = aws_lb_listener.listener_nlb_ansk8jul.arn
}

output "aws_lb_target_group_arn" {
  description = "Application load balancer target group Amazon Resource Name (ARN)"
  value       = aws_lb_target_group.tg_nlb_ansk8jul.arn
}

