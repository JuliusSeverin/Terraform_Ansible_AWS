variable "security_groups" {

  default = {}
}

variable "subnets" {

  type = list(string)
}

variable "vpc_id" {

  default = {}
}

variable "target_id" {

  default = {}
}

variable "basecertarn" {

  default = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"
}
