resource "aws_vpc" "vpck8ans" {
  
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "subnt1_vpck8ans" {
  
  vpc_id                  = aws_vpc.vpck8ans.id
  cidr_block              = var.subnet1_cidr
  map_public_ip_on_launch = true  
  availability_zone       = var.az_1

  tags = {
    Name = "subnt1k8ans"
  }
}

resource "aws_subnet" "subnt2_vpck8ans" {
  
  vpc_id                  = aws_vpc.vpck8ans.id
  cidr_block              = var.subnet2_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.az_2

  tags = {
    Name = "subnt2k8ans"
  }
}

resource "aws_internet_gateway" "igw_vpck8ans" {

  vpc_id = aws_vpc.vpck8ans.id

  tags = {
    Name = "igw-vpck8ans"
  }
}

resource "aws_route_table" "rt_vpck8ans" {

  vpc_id = aws_vpc.vpck8ans.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_vpck8ans.id
  }

  tags = {
    Name = "rt_vpck8ans"
  }
}

resource "aws_route_table_association" "rt_assoc_vpck8ans" {

  subnet_id      = aws_subnet.subnt1_vpck8ans.id
  route_table_id = aws_route_table.rt_vpck8ans.id

}

resource "aws_route_table" "rt2_vpck8ans" {

  vpc_id = aws_vpc.vpck8ans.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_vpck8ans.id
  }

  tags = {
    Name = "rt2_vpck8ans"
  }
}

resource "aws_route_table_association" "rt2_assoc_vpck8ans" {

  subnet_id      = aws_subnet.subnt2_vpck8ans.id
  route_table_id = aws_route_table.rt2_vpck8ans.id

}

