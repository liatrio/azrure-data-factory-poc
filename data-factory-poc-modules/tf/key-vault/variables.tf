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

variable "sku" {
  type = string
  default = "standard"
}

variable "data_admin_principal_ids" {
  type = set(string)
}

variable "data_reader_principal_ids" {
  type = set(string)
}

variable "name" {
  type = string
}
