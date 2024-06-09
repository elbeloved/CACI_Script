variable "project" {}

variable "access_ports" {
  type    = list(number)
  default = [ ] 
}

variable "vpc_id" {
  type    = string
  default = ""
}
