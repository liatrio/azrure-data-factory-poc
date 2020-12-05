resource "azurerm_sql_firewall_rule" "azure_services" {
  name                = "azure-services"
  resource_group_name = var.resource_group
  server_name         = azurerm_mssql_server.this.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

resource "azurerm_sql_firewall_rule" "clients" {
  for_each            = var.clients
  name                = each.key
  resource_group_name = var.resource_group
  server_name         = azurerm_mssql_server.this.name
  start_ip_address    = each.value
  end_ip_address      = each.value
}
