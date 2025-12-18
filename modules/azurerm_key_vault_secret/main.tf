resource "azurerm_key_vault_secret" "secrets" {
  for_each     = var.secrets
  name         = each.key
  value        = each.value.value
  key_vault_id = data.azurerm_key_vault.kv.id
  content_type = try(each.value.content_type, "text/plain")
}