variable "rgs" {
  type = map(object({
    name       = string
    location   = string
    managed_by = string
    tags       = map(string)
  }))
}

# variable "stg" {
#   type = map(object({
#     name                     = string
#     resource_group_name      = string
#     location                 = string
#     account_tier             = string
#     account_replication_type = string
#     tags                     = map(string)
#   }))
# }

# variable "infra_containers" {
#   type = map(object({
#     name                  = string
#     storage_account_name  = string
#     container_access_type = string
#   }))
# }


variable "vnets" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    subnets = map(object({
      name             = string
      address_prefixes = list(string)
    }))
  }))
}


variable "infra_pips" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    allocation_method   = string
    sku                 = string
    tags                = map(string)
  }))
}

variable "vms" {
  description = "Virtual machines configuration"
  type        = any
}


variable "key_vaults" {

}

# variable "secrets" {
#   description = "Map of secrets to create"
#   type = map(object({
#     value        = string
#     content_type = optional(string)
#   }))
#   sensitive = true
# }

variable "nics" {
  description = "Map of NICs to create"
  type = map(object({
    nic_name = string
    location = string
    rg_name  = string
    ip_configuration = object({
      subnet_name = string
      vnet_name   = string
      pip_name    = string
    })
  }))
}

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