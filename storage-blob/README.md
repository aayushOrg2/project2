# Azure Storage Blob Terraform Module

This Terraform module creates an Azure Storage Blob with customizable settings, including blob name, storage account, storage container, blob type, size, and access tier.

## Usage

```hcl
module "storage_blob" {
  source = "./path/to/module"

  name                   = var.name
  storage_account_name   = var.storage_account_name
  storage_container_name = var.storage_container_name
  type                   = var.type
  size                   = var.size
  access_tier            = var.access_tier
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
| [azurerm_storage_blob.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_blob) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | The name of the storage blob. Must be unique within the storage container the blob is located. | `string` | n/a | yes |
| storage\_account\_name | Specifies the storage account in which to create the storage container. | `string` | n/a | yes |
| storage\_container\_name | The name of the storage container in which this blob should be created. | `string` | n/a | yes |
| type | The type of the storage blob to be created. Possible values are Append, Block or Page. | `string` | n/a | yes |
| size | Used only for page blobs to specify the size in bytes of the blob to be created. | `number` | `null` | no |
| access\_tier | The access tier of the storage blob. Possible values are Archive, Cool and Hot. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the Storage Blob. |
| url | The URL of the blob. |

## Example

```hcl
module "storage_blob" {
  source = "../"

  name                   = "blob-app-test-eastus-001"
  storage_account_name   = "stapptest001"
  storage_container_name = "stappcontainertest001"
  type                   = "Block"
  size                   = null
  access_tier            = "Hot"
}
```
