output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.example.name
}

output "resource_group_location" {
  description = "The location of the resource group"
  value       = azurerm_resource_group.example.location
}

output "resource_group_tags" {
  description = "The tags of the resource group"
  value       = azurerm_resource_group.example.tags
}
