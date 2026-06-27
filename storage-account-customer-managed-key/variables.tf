variable "storage_account_id" {
  description = "The ID of the Storage Account. Changing this forces a new resource to be created."
  type        = string
}

variable "name" {
  description = "The name of the Key Vault Key."
  type        = string
}

variable "key_vault_id" {
  description = "The ID of the Key Vault. Required when not specifying managed_hsm_key_id or key_vault_uri."
  type        = string
  default     = null
}

variable "key_vault_uri" {
  description = "URI pointing at the Key Vault. Required when using federated_identity_client_id."
  type        = string
  default     = null
}

variable "managed_hsm_key_id" {
  description = "Key ID of a key in a managed HSM."
  type        = string
  default     = null
}

variable "key_version" {
  description = "The version of Key Vault Key. Remove or omit to enable Automatic Key Rotation."
  type        = string
  default     = null
}

variable "user_assigned_identity_id" {
  description = "The ID of a user assigned identity."
  type        = string
  default     = null
}

variable "federated_identity_client_id" {
  description = "The Client ID of the multi-tenant application for cross-tenant customer-managed-keys server-side encryption."
  type        = string
  default     = null
}
