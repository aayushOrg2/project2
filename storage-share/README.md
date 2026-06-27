# Azure Storage Share Terraform Module

This Terraform module creates an Azure Storage File Share with customizable settings, including share name, storage account ID, access tier, enabled protocol, and quota size.

## Usage

```hcl
module "storage_share" {
  source = "./path/to/module"

  name               = var.name
  storage_account_id = var.storage_account_id
  access_tier        = var.access_tier
  enabled_protocol   = var.enabled_protocol
  quota              = var.quota
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.13.0 |
| azurerm | >= 4.23.0 |
| azapi | >= 1.0.0 |

## Providers

| Name | Version |
|------|---------|
| azapi | >= 1.0.0 |

## Resources

| Name | Type |
|------|------|
| [azapi_resource.file_share](https://registry.terraform.io/providers/Azure/azapi/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | The name of the storage share. | `string` | n/a | yes |
| storage\_account\_id | Specifies the storage account in which to create the share. | `string` | n/a | yes |
| quota | The maximum size of the share in gigabytes. For Standard storage accounts, quota must be between 1 GB and 5120 GB, or larger if large\_file\_share\_enabled is true. | `number` | n/a | yes |
| access\_tier | The access tier of the File Share. Possible values are `Hot`, `Cool`, `TransactionOptimized`, or `Premium`. | `string` | `"Hot"` | no |
| enabled\_protocol | The protocol used for the share. Possible values are `SMB` or `NFS`. | `string` | `"SMB"` | no |

## Outputs

| Name | Description |
|------|-------------|
| storage\_share\_id | The ID of the File Share. |

## Example

```hcl
module "storage_share" {
  source = "../"

  name               = "fs-app-test-eastus-001"
  storage_account_id = "/subscriptions/xxxx/.../storageAccounts/stapp001"

  access_tier      = "Hot"
  enabled_protocol = "SMB"
  quota            = 100
}
```
