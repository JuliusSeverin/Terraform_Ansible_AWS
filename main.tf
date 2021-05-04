provider "aws" {
  region = "eu-central-1"
}

# VPC + Route table + Internet gateway

module "vpc_rt_igw" {

  source = "./modules/vpc_rt_igw"

}

# Control nodes. !!ebs_block_device volume set to 30!!

module "ec2control" {

  source = "./modules/ec2control"

  sec_group_control = module.secgroup.security_group_id

  subnet_id = module.vpc_rt_igw.aws_subnet

  control_count = "1" # var default value 1
}

# Worker nodes. !!ebs_block_device volume volume set to 30!!

module "ec2nodes" {

  source = "./modules/ec2nodes"

  sec_group_nodes = module.secgroup.security_group_id

  subnet_id = module.vpc_rt_igw.aws_subnet

  node_count = "2" # var default value 2
}

# Security groups. 

module "secgroup" {

  source = "./modules/secgroup"
  
  vpc_id = module.vpc_rt_igw.vpc_id
}

# ec2 ips for load balancer subnets variable

data "aws_subnet_ids" "vpck8ans" {
  vpc_id = module.vpc_rt_igw.vpc_id

  depends_on = [
    module.vpc_rt_igw.aws_subnet, module.vpc_rt_igw.aws_subnet2
  ]
}

# Load balancer NLB

module "loadbalancers" {

  source = "./modules/loadbalancers"

  count           = module.ec2control.control_count
  
  target_id       = element(split(", ", module.ec2control.control_priv_ips_string), count.index)
  
  subnets         = data.aws_subnet_ids.vpck8ans.ids
  
  vpc_id          = module.vpc_rt_igw.vpc_id
  
  security_groups = module.secgroup.aws_alb_security_group_id

}

# Template - instance ip's to ansible hosts file

module "localfiles" {

  source = "./modules/localfiles"

  node_name       = module.ec2nodes.nodes_tags
  node_ip         = module.ec2nodes.node_public_ips
  control_name    = module.ec2control.control_tags
  control_ip      = module.ec2control.control_public_ips
  node_priv_ip    = module.ec2nodes.node_private_ips
  control_priv_ip = module.ec2control.control_private_ips
}


