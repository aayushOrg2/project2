variable "name" {
  description = "The name of the storage share"
  type        = string
}

variable "storage_account_id" {
  description = "Specifies the storage account in which to create the share."
  type        = string
}

variable "access_tier" {
  description = "The access tier of the File Share"
  type        = string
  default     = "Hot"
  validation {
    condition     = contains(["Hot", "Cool", "TransactionOptimized", "Premium"], var.access_tier)
    error_message = "The access_tier must be one of 'Hot', 'Cool', 'TransactionOptimized', or 'Premium'."
  }
}


variable "enabled_protocol" {
  description = "The protocol used for the share"
  type        = string
  default     = "SMB"
  validation {
    condition     = contains(["SMB", "NFS"], var.enabled_protocol)
    error_message = "The enabled_protocol must be either 'SMB' or 'NFS'."
  }
}

variable "quota" {
  description = "The maximum size of the share, in gigabytes. For Standard storage accounts, quota must be between 1 GB and 5120 GB, or larger if large_file_share_enabled is true."
  type        = number
}
