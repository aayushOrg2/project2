# Azure Storage Account Customer Managed Key Terraform Module

This Terraform module configures an Azure Storage Account Customer Managed Key with customizable settings, including Key Vault or Managed HSM key integration, key version, user assigned identity, and federated identity client support for cross-tenant encryption.

## Usage

```hcl
module "storage_account_cmk" {
  source = "./path/to/module"

  storage_account_id           = var.storage_account_id
  name                         = var.name
  key_vault_id                 = var.key_vault_id
  key_vault_uri                = var.key_vault_uri
  managed_hsm_key_id           = var.managed_hsm_key_id
  key_version                  = var.key_version
  user_assigned_identity_id    = var.user_assigned_identity_id
  federated_identity_client_id = var.federated_identity_client_id
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.13.0 |
| azurerm | >= 4.23.0 |

## Providers

| Name | Version |
|------|---------|
| azurerm | >= 4.23.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_storage_account_customer_managed_key.customer_managed_key](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account_customer_managed_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| storage\_account\_id | The ID of the Storage Account. Changing this forces a new resource to be created. | `string` | n/a | yes |
| name | The name of the Key Vault Key. | `string` | n/a | yes |
| key\_vault\_id | The ID of the Key Vault. Required when not specifying managed\_hsm\_key\_id or key\_vault\_uri. | `string` | `null` | no |
| key\_vault\_uri | URI pointing at the Key Vault. Required when using federated\_identity\_client\_id. | `string` | `null` | no |
| managed\_hsm\_key\_id | Key ID of a key in a managed HSM. | `string` | `null` | no |
| key\_version | The version of Key Vault Key. Remove or omit to enable Automatic Key Rotation. | `string` | `null` | no |
| user\_assigned\_identity\_id | The ID of a user assigned identity. | `string` | `null` | no |
| federated\_identity\_client\_id | The Client ID of the multi-tenant application for cross-tenant customer-managed-keys server-side encryption. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| storage\_account\_customer\_managed\_key\_id | The ID of the Storage Account Customer Managed Key. |

## Example

```hcl
module "storage_account_cmk" {
  source = "../"

  storage_account_id = "/subscriptions/xxxx/resourceGroups/rg-app-test-eastus-001/providers/Microsoft.Storage/storageAccounts/stapp001"

  name = "key-app-test-eastus-001"

  key_vault_id = "/subscriptions/xxxx/resourceGroups/rg-app-test-eastus-001/providers/Microsoft.KeyVault/vaults/kv-app-test-eastus-001"

  key_vault_uri                = null
  managed_hsm_key_id           = null
  key_version                  = null
  user_assigned_identity_id    = null
  federated_identity_client_id = null
}
```
