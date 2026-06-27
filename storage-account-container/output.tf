output "container_id" {
  description = "The ID of the created container."
  value       = azapi_resource.container.id
}

output "container_name" {
  description = "The name of the created container."
  value       = azapi_resource.container.name
}

output "container_type" {
  description = "The type of the created container."
  value       = azapi_resource.container.type
}

