resource "azurerm_role_assignment" "container_blob_data_contributor" {
  for_each = var.contributor_principal_ids
  principal_id         = each.value
  scope                = "/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group}/providers/Microsoft.Storage/storageAccounts/${var.storage_account_name}/blobServices/default/containers/${azurerm_storage_container.this.name}"
  role_definition_name = "Storage Blob Data Contributor"
}
