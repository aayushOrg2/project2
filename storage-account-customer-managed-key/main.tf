resource "azurerm_storage_account_customer_managed_key" "customer_managed_key" {
  storage_account_id           = var.storage_account_id
  key_vault_id                 = var.key_vault_id
  key_name                     = var.name
  key_vault_uri                = var.key_vault_uri
  managed_hsm_key_id           = var.managed_hsm_key_id
  key_version                  = var.key_version
  user_assigned_identity_id    = var.user_assigned_identity_id
  federated_identity_client_id = var.federated_identity_client_id

  lifecycle {
    ignore_changes = [key_version]
  }
}
