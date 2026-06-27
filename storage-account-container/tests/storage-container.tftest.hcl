mock_provider "azapi" {}

run "unit_validate_storage_container_configuration" {
  command = plan

  # Resource mapping validation

  assert {
    condition     = azapi_resource.container.name == var.name
    error_message = "Container name did not match as expected."
  }

  assert {
    condition     = azapi_resource.container.parent_id == "${var.storage_account_id}/blobServices/default"
    error_message = "Storage account ID did not match as expected."
  }

  assert {
    condition     = azapi_resource.container.body.properties.publicAccess == var.container_access_type
    error_message = "Container access type did not match."
  }

  # Naming validation - Azure rule: lowercase, 3–63 chars

  assert {
    condition     = can(regex("^[a-z0-9]{3,63}$", var.name))
    error_message = "Container name must be 3-63 characters, lowercase alphanumeric."
  }

  # Access type validation

  assert {
    condition     = contains(["None", "Blob", "Container"], var.container_access_type)
    error_message = "Invalid container access type."
  }

  # Immutable settings validation

  assert {
    condition     = var.container_immutable_versioning == true || var.container_immutable_versioning == false
    error_message = "Immutable versioning must be true or false."
  }

  assert {
    condition     = var.enable_properties_immutable_versioning == true || var.enable_properties_immutable_versioning == false
    error_message = "Enable properties immutable versioning must be true or false."
  }
}
