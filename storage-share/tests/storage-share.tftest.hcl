mock_provider "azapi" {}

run "unit_validate_storage_file_share_configuration" {
  command = plan

  # Resource mapping validation

  assert {
    condition     = azapi_resource.file_share.name == var.name
    error_message = "File Share name did not match as expected."
  }

  assert {
    condition     = azapi_resource.file_share.parent_id == "${var.storage_account_id}/fileServices/default"
    error_message = "Parent ID did not match."
  }

  # Properties validation
  # azapi uses body → properties

  assert {
    condition     = azapi_resource.file_share.body.properties.accessTier == var.access_tier
    error_message = "Access tier did not match."
  }

  assert {
    condition     = azapi_resource.file_share.body.properties.enabledProtocols == var.enabled_protocol
    error_message = "Enabled protocol did not match."
  }

  assert {
    condition     = azapi_resource.file_share.body.properties.shareQuota == var.quota
    error_message = "Quota did not match."
  }

  # Naming convention

  assert {
    condition     = can(regex("^fs-[a-z0-9]+-(dev|test|stage|prod)-[a-z0-9]+-[0-9]{3}$", var.name))
    error_message = "File Share name does not follow naming convention."
  }

  assert {
    condition     = length(var.name) <= 80
    error_message = "File Share name exceeds allowed length."
  }

  # Access tier validation

  assert {
    condition = contains(
      ["Hot", "Cool", "TransactionOptimized", "Premium"],
      var.access_tier
    )
    error_message = "Invalid access tier."
  }

  # Protocol validation

  assert {
    condition     = contains(["SMB", "NFS"], var.enabled_protocol)
    error_message = "Invalid protocol."
  }

  # Quota validation

  assert {
    condition     = var.quota > 0
    error_message = "Quota must be greater than 0."
  }
}
