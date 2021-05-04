output "vpc_id" {
  description = "vpc id"
  value       = aws_vpc.vpck8ans.id
}

output "aws_subnet" {
  description = "aws subnet subnt1_vpck8ans id"
  value       = aws_subnet.subnt1_vpck8ans.id
}

output "aws_subnet2" {
  description = "aws subnet subnt2_vpck8ans id"
  value       = aws_subnet.subnt2_vpck8ans.id
}

output "aws_internet_gateway" {
  description = "aws internet gateway igw_vpck8ans id"
  value       = aws_internet_gateway.igw_vpck8ans.id
}

output "aws_route_table" {
  description = "aws route table rt_vpck8ans id"
  value       = aws_route_table.rt_vpck8ans.id
}

output "aws_route_table2" {
  description = "subnet2 aws route table rt2_vpck8ans id"
  value       = aws_route_table.rt2_vpck8ans.id
}
