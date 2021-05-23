variable "resource_group_name" {
    description = "resource_group_name"
}

variable "resource_group_location" {
    description = "resource_group_location"
}

variable "lb" {
    description = "name of the loadbalancer"
}

variable "public_id" {
    
}

variable "publicipname" {
    description = "name of the public ip"
}

variable "ports" {
    type = list 
    default =["80","8080"]
}