resource "azurerm_mssql_server" "this" {
  name                          = var.server_name
  administrator_login           = random_password.admin_login.result
  administrator_login_password  = random_password.admin_password.result
  location                      = var.region
  resource_group_name           = var.resource_group
  version                       = "12.0"
  public_network_access_enabled = true
  minimum_tls_version           = "1.2"
}
