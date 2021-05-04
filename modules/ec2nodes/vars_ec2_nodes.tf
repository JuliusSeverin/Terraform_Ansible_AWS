variable "ami_id" {
  default = "ami-05f7491af5eef733a" #ubuntuserver2004.  
}

variable "node_count" {
  default = "2"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "aws_region" {
  default = "eu-central-1"
}

variable "sec_group_nodes" {

  default = {}
}

variable "subnet_id" {

  default = {}
}
