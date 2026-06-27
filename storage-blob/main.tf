resource "azurerm_storage_blob" "main" {
  name                   = var.name
  storage_account_name   = var.storage_account_name
  storage_container_name = var.storage_container_name
  type                   = var.type
  size                   = var.size
  access_tier            = var.access_tier


}
