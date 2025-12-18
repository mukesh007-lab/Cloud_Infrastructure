output "nic_ids" {
  description = "Map of NIC IDs created by this module"
  value       = { for k, v in azurerm_network_interface.nic : k => v.id }
}
