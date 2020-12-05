include {
  path = "${find_in_parent_folders()}"
}

locals {
  common                          = yamldecode(file(find_in_parent_folders("common_vars.yaml")))
  sandbox_owners_group_id = "<<TODO: group id for sandbox owners>>"
}

dependency "data_factory" {
  config_path  = "../data-factory"
  mock_outputs = {
    managed_identity_principal_id = "mock"
  }
}

inputs = {
  name                      = "ldatafactorypocsa"
  data_admin_principal_ids  = [
    local.sandbox_owners_group_id,
    local.common.pipeline_sp_id
  ]
  data_reader_principal_ids = [
    dependency.data_factory.outputs.managed_identity_principal_id,
  ]
}
