variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {}

variable "ASG_Components" {
  type = map(string)
  default = {
    max_size                  = 4
    min_size                  = 2
    desired_capacity          = 2
    health_check_grace_period = 30
    health_check_type         = "EC2"
    instance_type             = "t3.micro"
    on_demand_base            = 0
    on_demand_percentage      = 25
    spot_allocation_strategy  = "capacity-optimized-prioritized"
  }
}

variable "LTG_Components" {
  type = map(string)
  default = {
    port                = 443
    protocol            = "HTTPS"
    matcher             = 200
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 4
    unhealthy_threshold = 2
    instance_type       = "t3.micro"
  }
}

variable "project" {
  default = "CACI"
}

variable "role_path" {
  default = "/"
}

variable "access_ports" {
  type    = list(number)
  default = [4001, 4002, 4003, 443]
}

variable "block_device_config" {
  type    = list(object({
    device_name  = string
    volume_size  = number
  }))
  default = [
  {
    device_name = "/dev/sdf"
    volume_size = 100
  }
  ]
}

variable "cidr" {
    description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
    type        = string
    default     = "10.0.0.0/16"
}

variable "cidr_private_subnet" {
    description = "CIDR block for private subnet"
    type        = list
    default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "instance_tenancy" {
    description = "A tenancy option for instances launched into the VPC"
    type        = string
    default     = "default"
}

variable "enable_dns_hostnames" {
    description = "Should be true to enable DNS hostnames in the VPC"
    type        = bool
    default     = true
}

variable "enable_dns_support" {
    description = "Should be true to enable DNS support in the VPC"
    type        = bool
    default     = true
}

variable "subnet_availability_zone" {
    type        = list
    default     = ["us-east-1a", "us-east-1b"]
}

