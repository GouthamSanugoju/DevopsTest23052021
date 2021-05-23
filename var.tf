#resource_group
variable "resource_group_name" {
    description = "resource_group_name"
}

variable "resource_group_location" {
    description = "resource_group_location"
}
variable "vnet" {
  description = "vnet name"
}

variable "subnet" {
  description = "subnet name"
}

variable "nsg" {
  description = "Network security group name"
}

variable "publicipname" {
    description = "name of the public ip"
}

variable "lb" {
    description = "name of the loadbalancer"
}

variable "vmssname" {
    description = "name of the Virtual machine scaleset "
}

variable "password" {
    description = "password required for logging in"
}

variable "username" {
    description = "username required for logging in"
}