resource "azurerm_role_assignment" "key_vault_admin" {
  for_each = var.data_admin_principal_ids
  principal_id         = each.value
  scope                = "/subscriptions/${var.subscription_id}/resourcegroups/${var.resource_group}/providers/Microsoft.KeyVault/vaults/${azurerm_key_vault.this.name}"
  role_definition_name = "Key Vault Administrator (preview)"
}

resource "azurerm_role_assignment" "key_vault_data_factory_reader" {
  for_each = var.data_reader_principal_ids
  principal_id         = each.value
  scope                = "/subscriptions/${var.subscription_id}/resourcegroups/${var.resource_group}/providers/Microsoft.KeyVault/vaults/${azurerm_key_vault.this.name}"
  role_definition_name = "Key Vault Secrets User (preview)"
}
