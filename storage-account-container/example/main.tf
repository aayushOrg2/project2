module "storage_container" {
  source = "../"

  name = "stappcontainertest001"

  storage_account_id = "/subscriptions/xxxx/resourceGroups/rg-app-test-eastus-001/providers/Microsoft.Storage/storageAccounts/stapp001"

  container_access_type = "None"

  container_immutable_versioning = false

  enable_properties_immutable_versioning = false
}