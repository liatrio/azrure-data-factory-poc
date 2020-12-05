include {
  path = "${find_in_parent_folders()}"
}

locals {
  common = yamldecode(file(find_in_parent_folders("common_vars.yaml")))
}

inputs = {
  name            = "ldatafactorypocsa"
  git_integration = "vsts"
  vsts_config     = {
    account_name    = "<<TODO: need account name>>"
    branch_name     = "main"
    project_name    = "<<TODO: ADO Project>>"
    repository_name = "data-factory-poc-adf"
    root_folder     = "/adf"
    tenant_id       = local.common.tenant_id
  }
}
