
output "security_group_id" {
  description = "security group id"
  value       = aws_security_group.AnsibleJulSG.id
}

output "security_group_name" {
  description = "security group name"
  value       = aws_security_group.AnsibleJulSG.name
}

output "aws_alb_security_group_id" {
  description = "alb_security group id"
  value       = aws_security_group.lbjulsg.id
}

output "aws_alb_security_group_name" {
  description = "alb ecurity group name"
  value       = aws_security_group.lbjulsg.name
}
