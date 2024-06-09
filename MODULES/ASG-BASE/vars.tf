variable "ami_id" {}

variable "project" {}

variable "stack_controls" {
  type    = map(string)
  default = {}
}

variable "ASG_Components" {
  type    = map(string)
  default = {}
}

variable "LTG_Components" {
  type = map(string)
  default = {}
}

variable "block_device_config" {
  type    = list(object({
    device_name  = string
    volume_size  = number
  }))
  default = [
  {
    device_name = ""
    volume_size = null
  }
  ]
}

variable "security_group_id" {
  type    = list(string)
  default = [ ]
}

variable "vpc_id" {}

variable "private_subnet" {}

variable "instance_profile_arn" {}

