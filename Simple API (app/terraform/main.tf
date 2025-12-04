module "network" {
source = "./modules/network"
cidr_block = var.vpc_cidr
azs = slice(data.aws_availability_zones.available.names, 0, 2)
}


module "alb" {
source = "./modules/alb"
public_subnets = module.network.public_subnets
}


module "asg" {
source = "./modules/asg"
private_subnets = module.network.private_subnets
ami_id = var.ami_id
instance_type = var.instance_type
}
