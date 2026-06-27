locals {
  body = {
    properties = {
      immutableStorageWithVersioning = var.enable_properties_immutable_versioning ? { enabled = var.container_immutable_versioning } : null
      publicAccess                   = var.container_access_type
    }
  }
}
