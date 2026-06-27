variable "name" {
  description = "The name of the container."
  type        = string
  default     = "defaultcontainer"
}

variable "storage_account_id" {
  description = "The ID of the storage account."
  type        = string
  default     = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-test/providers/Microsoft.Storage/storageAccounts/sttest"
}

variable "container_access_type" {
  description = "The public access level of the container."
  type        = string
  default     = "None"
}

variable "container_immutable_versioning" {
  description = "Enable or disable immutable storage with versioning."
  type        = bool
  default     = false
}

variable "enable_properties_immutable_versioning" {
  description = "flag for enable properties for immutable_versioning."
  type        = bool
  default     = false
}
