resource "azapi_resource" "file_share" {
  type      = "Microsoft.Storage/storageAccounts/fileServices/shares@2023-05-01"
  name      = var.name
  parent_id = "${var.storage_account_id}/fileServices/default"
  body = {
    properties = {
      accessTier       = var.access_tier
      enabledProtocols = var.enabled_protocol
      shareQuota       = var.quota
    }
  }
}

