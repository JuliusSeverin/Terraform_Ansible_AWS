# security group for ansk8jul setup"

resource "aws_security_group" "AnsibleJulSG" {

  name        = "AnsibleJulSG"
  description = "Allow inbound from 22 80 443 6443 ICMP"

  vpc_id = var.vpc_id

  # Allow inbound from 22 80 443 6443"
  dynamic "ingress" {
    for_each = var.dynamic_ingress
    content {
      from_port   = ingress.key
      to_port     = ingress.key
      cidr_blocks = ingress.value
      protocol    = "tcp"
    }
  }

  ingress {
    description = "ICMP ping"
    from_port   = 8
    to_port     = 0
    protocol    = "ICMP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "AnsibleJulSG"
  }
}

# load balancer security group.

resource "aws_security_group" "lbjulsg" {

  name        = "lbjulsg"
  description = "alb for ansk8jul setup. Allow inboud from 22,443,6443,ICMP"

  vpc_id = var.vpc_id

  #Allow inboud from 22,443,6443
  dynamic "ingress" {
    for_each = var.dynamic_ingress_lb
    content {
      from_port   = ingress.key
      to_port     = ingress.key
      cidr_blocks = ingress.value
      protocol    = "tcp"
    }
  }

  ingress {
    description = "ICMP ping"
    from_port   = 8
    to_port     = 0
    protocol    = "ICMP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "albjulsg"
  }
}
