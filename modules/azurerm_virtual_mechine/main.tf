resource "azurerm_linux_virtual_machine" "vm" {
  for_each            = var.vms
  name                = each.value.vm_name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  size                = each.value.size

  admin_username = each.value.admin_username
  admin_password = each.value.admin_password
  disable_password_authentication = each.value.disable_password_authentication
  network_interface_ids = [var.nic_ids[each.key]] 

  source_image_reference {
    publisher = each.value.source_image_reference.publisher
    offer     = each.value.source_image_reference.offer
    sku       = each.value.source_image_reference.sku
    version   = each.value.source_image_reference.version
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  tags = {}
}