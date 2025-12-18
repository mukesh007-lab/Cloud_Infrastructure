variable "vms" {
  description = "Map of VM configuration"
  type = map(object({
    nic_name              = string
    location              = string
    rg_name               = string
    vnet_name             = string
    subnet_name           = string
    pip_name              = string
    vm_name               = string
    size                  = string
    admin_username        = string
    admin_password        = string
    disable_password_authentication = bool
    tags       = map(string)
    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
  }))
}

variable "nic_ids" {
  description = "Map of NIC IDs from NIC module"
  type        = map(string)
  default     = {}
}

