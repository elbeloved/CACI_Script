resource "aws_vpc" "CACI" {
    cidr_block            =   var.cidr
    instance_tenancy      =   var.instance_tenancy
    enable_dns_hostnames  =   var.enable_dns_hostnames
    enable_dns_support    =   var.enable_dns_support
}

resource "aws_subnet" "private_CACI_1a" {
    count                 =   length(var.cidr_private_subnet)
    vpc_id                =   aws_vpc.CACI.id
    availability_zone     =   var.subnet_availability_zone[count.index]
    cidr_block            =   var.cidr_private_subnet[count.index]
}

