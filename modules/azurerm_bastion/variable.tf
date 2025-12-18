variable "bastions" {
    type = map(object({
        name                = string
        location            = string
        resource_group_name = string
        ip_configuration = object({
        subnet_name = string
        vnet_name   = string
        pip_name    = string
        })
    }))
  
}