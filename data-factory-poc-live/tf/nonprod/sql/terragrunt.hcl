include {
  path = "${find_in_parent_folders()}"
}

dependency "key_vault" {
  config_path  = "../key-vault"
  mock_outputs = {
    id = "mock"
  }
}

inputs = {
  server_name   = "ldatafactorypocnp"
  database_name = "upload"
  key_vault_id  = dependency.key_vault.outputs.id
  clients       = {
    <<TODO: clients for firewall rule>>
  },
}
