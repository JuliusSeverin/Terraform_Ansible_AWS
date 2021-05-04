output "control_public_ips" {
  description = "List of public IP addresses assigned to instances"
  value       = aws_instance.control[*].public_ip
}

output "control_private_ips" {
  description = "List of private IP addresses assigned to instances"
  value       = aws_instance.control[*].private_ip
}

output "control_priv_ips_string" {
  description = "Some solution for problems with alb target_id. In main.tf use element(split...)"
  value       = join(",", aws_instance.control[*].private_ip)
}

output "control_ami" {
  description = "Contol instance ami"
  value       = aws_instance.control[*].ami
}

output "instance_type" {
  description = "Control instance type"
  value       = aws_instance.control[*].instance_type
}

output "control_tags" {
  description = "Control instances tags"
  value       = aws_instance.control[*].tags.Name
}

output "control_instance_id" {
  description = "control instance id output"
  value       = aws_instance.control[*].id
}

output "control_count" {
  description = "number of instances"
  value       = length(aws_instance.control)
}

