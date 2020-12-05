include {
  path = "${find_in_parent_folders()}"
}

locals {
  common                          = yamldecode(file(find_in_parent_folders("common_vars.yaml")))
  nonprod_owners_group_id = "<<TODO: get group id for env>>"
}

dependency "data_factory" {
  config_path  = "../data-factory"
  mock_outputs = {
    managed_identity_principal_id = "mock"
  }
}

inputs = {
  name                      = "ldatafactorypocnp"
  data_admin_principal_ids  = [
    local.nonprod_owners_group_id,
    local.common.pipeline_sp_id
  ]
  data_reader_principal_ids = [
    dependency.data_factory.outputs.managed_identity_principal_id,
  ]
}
