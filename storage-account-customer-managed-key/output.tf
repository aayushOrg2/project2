output "storage_account_customer_managed_key_id" {
  description = "The ID of the Storage Account Customer Managed Key."
  value       = azurerm_storage_account_customer_managed_key.customer_managed_key.id
}