variable "vmssname" {
    description = "name of the Virtual machine scaleset "
}

variable "resource_group_name" {
    description = "resource_group_name"
}

variable "resource_group_location" {
    description = "resource_group_location"
}

variable "password" {
    description = "password required for logging in"
}

variable "username" {
    description = "username required for logging in"
}

variable "subnet_id" { 
}

variable "bdepool_id" {  
}

variable "nat_pool_id" {  
}