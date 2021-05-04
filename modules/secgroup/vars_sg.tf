variable "vpc_id" {

  default = {}
}

variable "dynamic_ingress" {
  description = "Allow inbound from 22 80 443 6443"

  type = map(any)
  default = {
    "22"   = ["0.0.0.0/0"]
    "80"   = ["0.0.0.0/0"]
    "443"  = ["0.0.0.0/0"]
    "6443" = ["0.0.0.0/0"]
  }
}

variable "dynamic_ingress_lb" {
  description = "Allow LB inbound from 22, 443, 6443"

  type = map(any)
  default = {
    "22"   = ["0.0.0.0/0"]
    "443"  = ["0.0.0.0/0"]
    "6443" = ["0.0.0.0/0"]
  }
}
