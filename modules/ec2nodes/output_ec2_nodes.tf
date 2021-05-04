output "node_public_ips" {
  description = "Public IP addresses assigned to instances"
  value       = aws_instance.node[*].public_ip
}

output "node_private_ips" {
  description = "Private IP addresses assigned to instances"
  value       = aws_instance.node[*].private_ip
}

output "node_ami" {
  description = "Node instance ami"
  value       = aws_instance.node[*].ami
}

output "instance_type" {
  description = "Node instance type"
  value       = aws_instance.node[*].instance_type
}

output "nodes_tags" {
  description = "Nodes instances tags"
  value       = aws_instance.node[*].tags.Name
}

output "node_instance_id" {
  description = "instance id output"
  value       = aws_instance.node[*].id
}
