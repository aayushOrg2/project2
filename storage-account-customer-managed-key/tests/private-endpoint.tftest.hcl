mock_provider "azurerm" {}

run "unit_validate_storage_account_cmk_configuration" {

  command = plan

  # Resource Mapping Validation

  assert {
    condition     = azurerm_storage_account_customer_managed_key.customer_managed_key.storage_account_id == var.storage_account_id
    error_message = "Storage Account ID did not match as expected."
  }

  assert {
    condition     = azurerm_storage_account_customer_managed_key.customer_managed_key.key_vault_id == var.key_vault_id
    error_message = "Key Vault ID did not match as expected."
  }

  assert {
    condition     = azurerm_storage_account_customer_managed_key.customer_managed_key.key_name == var.name
    error_message = "Key name did not match as expected."
  }

  # Optional Fields Validation

  assert {
    condition = var.key_version == null || (
      azurerm_storage_account_customer_managed_key.customer_managed_key.key_version == var.key_version
    )
    error_message = "Key version did not match as expected."
  }

  assert {
    condition = var.user_assigned_identity_id == null || (
      azurerm_storage_account_customer_managed_key.customer_managed_key.user_assigned_identity_id == var.user_assigned_identity_id
    )
    error_message = "User assigned identity ID did not match as expected."
  }

  assert {
    condition = var.federated_identity_client_id == null || (
      azurerm_storage_account_customer_managed_key.customer_managed_key.federated_identity_client_id == var.federated_identity_client_id
    )
    error_message = "Federated identity client ID did not match as expected."
  }

  # Resource ID Validation

  assert {
    condition     = can(regex("^/subscriptions/.*/resourceGroups/.*/providers/Microsoft\\.Storage/storageAccounts/.+", var.storage_account_id))
    error_message = "Invalid storage account ID format."
  }

  assert {
    condition     = var.key_vault_id == null || can(regex("^/subscriptions/.*/resourceGroups/.*/providers/Microsoft\\.KeyVault/vaults/.+", var.key_vault_id))
    error_message = "Invalid Key Vault ID format."
  }

  # Naming Validation

  assert {
    condition     = can(regex("^key-[a-z0-9]+-(dev|test|stage|prod)-[a-z0-9]+-[0-9]{3}$", var.name))
    error_message = "Invalid key naming convention."
  }

  assert {
    condition     = length(var.name) <= 80
    error_message = "Key name too long."
  }

  # Logical Validation 

  assert {
    condition     = var.key_vault_id != null || var.managed_hsm_key_id != null
    error_message = "Either Key Vault ID or Managed HSM Key ID must be provided."
  }
}
