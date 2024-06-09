module "VPC-BASE" {
  source                      = "../../../MODULES/VPC-BASE"
  cidr                        = var.cidr
  cidr_private_subnet         = var.cidr_private_subnet
  instance_tenancy            = var.instance_tenancy
  enable_dns_hostnames        = var.enable_dns_hostnames
  enable_dns_support          = var.enable_dns_hostnames
  subnet_availability_zone    = var.subnet_availability_zone
}

module "SECURITY-BASE" {
  source                      = "../../../MODULES/SECURITY-BASE"
  access_ports                = var.access_ports
  vpc_id                      = module.VPC-BASE.stack_vpc_id
  project                     = var.project
}

module "ASG-BASE" {
  source                      = "../../../MODULES/ASG-BASE"
  ami_id                      = data.aws_ami.amzLinux.id 
  ASG_Components              = var.ASG_Components
  project                     = var.project
  LTG_Components              = var.LTG_Components
  security_group_id           = module.SECURITY-BASE[*].security_group_stack
  vpc_id                      = module.VPC-BASE.stack_vpc_id
  private_subnet              = module.VPC-BASE[*].private_subnet
  block_device_config         = var.block_device_config
  instance_profile_arn        = module.IAM-BASE.instance_profile_arn
}

module "IAM-BASE" {
  source                      = "../../../MODULES/IAM-BASE"
  project                     = var.project
  role_path                   = var.role_path
}
