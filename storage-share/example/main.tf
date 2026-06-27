module "storage_share" {
  source = "../"

  name               = "fs-app-test-eastus-001"
  storage_account_id = "/subscriptions/xxxx/.../storageAccounts/stapp001"

  access_tier      = "Hot"
  enabled_protocol = "SMB"
  quota            = 100
}