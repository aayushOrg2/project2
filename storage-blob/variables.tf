variable "name" {
  description = "The name of the storage blob. Must be unique within the storage container the blob is located."
  type        = string

}
variable "storage_account_name" {
  description = "Specifies the storage account in which to create the storage container."
  type        = string

}
variable "storage_container_name" {
  description = "The name of the storage container in which this blob should be created."
  type        = string

}
variable "type" {
  description = "The type of the storage blob to be created. Possible values are Append, Block or Page."
  type        = string

}
variable "size" {
  description = "Used only for page blobs to specify the size in bytes of the blob to be created."
  type        = number
  default     = null

}
variable "access_tier" {
  description = "The access tier of the storage blob. Possible values are Archive, Cool and Hot."
  type        = string
  default     = null
}
