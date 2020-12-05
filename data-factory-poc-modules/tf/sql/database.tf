resource "azurerm_mssql_database" "this" {
  name                        = var.database_name
  server_id                   = azurerm_mssql_server.this.id
  auto_pause_delay_in_minutes = 60
  min_capacity                = 1
  sku_name                    = "GP_S_Gen5_1"
}
