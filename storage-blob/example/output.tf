output "storage_blob_id" {
  description = "ID of the storage blob from module"
  value       = module.storage_blob.storage_blob_id
}

output "storage_blob_name" {
  description = "Name of the storage blob from module"
  value       = module.storage_blob.storage_blob_name
}

output "storage_blob_url" {
  description = "URL of the storage blob from module"
  value       = module.storage_blob.storage_blob_url
}
