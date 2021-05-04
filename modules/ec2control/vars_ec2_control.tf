variable "ami_id" {
  default = "ami-05f7491af5eef733a" # ubuntuserver20.04.
}

variable "control_count" {
  default = "1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "aws_region" {
  default = "eu-central-1"
}

variable "sec_group_control" {

  default = {}
}

variable "subnet_id" {

  default = {}
}
