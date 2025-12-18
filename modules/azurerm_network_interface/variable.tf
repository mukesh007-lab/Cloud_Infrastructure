variable "nics" {
  description = "Map of NICs to create"
  type = map(object({
    nic_name         = string
    location         = string
    rg_name          = string
    ip_configuration = object({
      subnet_name = string
      vnet_name   = string
      pip_name    = string
    })
  }))
}