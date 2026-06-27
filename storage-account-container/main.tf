resource "azapi_resource" "container" {
  type      = "Microsoft.Storage/storageAccounts/blobServices/containers@2022-09-01"
  name      = var.name
  parent_id = "${var.storage_account_id}/blobServices/default"
  body      = local.body
}
