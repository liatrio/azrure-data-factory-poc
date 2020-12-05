variable "region" {
  type    = string
  default = "centralus"
}

variable "resource_group" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "storage_account_name" {
  type = string
}

variable "name" {
  type = string
}

variable "contributor_principal_ids" {
  type = set(string)
}
