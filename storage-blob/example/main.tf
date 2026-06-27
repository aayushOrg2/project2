module "storage_blob" {
  source = "../"

  name                   = "blob-app-test-eastus-001"
  storage_account_name   = "stapptest001"
  storage_container_name = "stappcontainertest001"
  type = "Block"
  size = null
  access_tier = "Hot"
}
