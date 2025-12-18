data "azurerm_subnet" "existing_subnet" {
  for_each = var.nics
  name                 = each.value.ip_configuration.subnet_name
  virtual_network_name = each.value.ip_configuration.vnet_name
  resource_group_name  = each.value.rg_name
}

data "azurerm_public_ip" "existing_pip" {
  for_each            = var.nics
  name                = each.value.ip_configuration.pip_name
  resource_group_name = each.value.rg_name
}