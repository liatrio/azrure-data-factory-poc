resource "random_password" "admin_login" {
  length  = 8
  special = false
}

resource "random_password" "admin_password" {
  length = 16
}

resource "azurerm_key_vault_secret" "admin_login" {
  key_vault_id = var.key_vault_id
  name         = "admin-login"
  value        = random_password.admin_login.result
}

resource "azurerm_key_vault_secret" "admin_password" {
  key_vault_id = var.key_vault_id
  name         = "admin-password"
  value        = random_password.admin_password.result
}

resource "azurerm_key_vault_secret" "connection_string" {
  key_vault_id = var.key_vault_id
  name         = "connection-string"
  value        = "Integrated Security=False;Encrypt=True;Connection Timeout=30;Data Source=${azurerm_mssql_server.this.fully_qualified_domain_name};Initial Catalog=${azurerm_mssql_database.this.name};User ID=${random_password.admin_login.result};Password=${random_password.admin_password.result}"
}
