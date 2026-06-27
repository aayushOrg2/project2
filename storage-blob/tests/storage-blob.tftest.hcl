mock_provider "azurerm" {}

run "unit_validate_storage_main_configuration" {
  command = plan

  # Resource mapping validation

  assert {
    condition     = azurerm_storage_blob.main.name == var.name
    error_message = "main name did not match as expected."
  }

  assert {
    condition     = azurerm_storage_blob.main.storage_account_name == var.storage_account_name
    error_message = "Storage account name did not match."
  }

  assert {
    condition     = azurerm_storage_blob.main.storage_container_name == var.storage_container_name
    error_message = "Storage container name did not match."
  }

  assert {
    condition     = azurerm_storage_blob.main.type == var.type
    error_message = "main type did not match."
  }

  # Naming validation (same as container rules)

  assert {
    condition     = can(regex("^[a-z0-9-]{3,63}$", var.name))
    error_message = "main name must be 3–63 chars, lowercase, alphanumeric or hyphens."
  }

  # main type validation

  assert {
    condition     = contains(["Block", "Append", "Page"], var.type)
    error_message = "main type must be Block, Append, or Page."
  }

  # Size validation (only for Page mains)

  assert {
    condition     = var.type != "Page" || (var.size != null && var.size > 0)
    error_message = "For Page mains, size must be provided and greater than 0."
  }

  # Access tier validation

  assert {
    condition     = var.access_tier == null || contains(["Hot", "Cool", "Archive"], var.access_tier)
    error_message = "Access tier must be Hot, Cool, or Archive."
  }
}