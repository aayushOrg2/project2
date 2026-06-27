# Azure Storage Account Container Terraform Module

This Terraform module creates an Azure Storage Account Blob Container with customizable settings, including container name, storage account ID, public access level, and immutable storage with versioning support.

## Usage

```hcl
module "storage_container" {
  source = "./path/to/module"

  name                                   = var.name
  storage_account_id                     = var.storage_account_id
  container_access_type                  = var.container_access_type
  container_immutable_versioning         = var.container_immutable_versioning
  enable_properties_immutable_versioning = var.enable_properties_immutable_versioning
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.13.0 |
| azurerm | >= 4.23.0 |
| azapi | 2.9.0 |

## Providers

| Name | Version |
|------|---------|
| azapi | 2.9.0 |

## Resources

| Name | Type |
|------|------|
| [azapi_resource.container](https://registry.terraform.io/providers/Azure/azapi/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | The name of the container. | `string` | `"defaultcontainer"` | no |
| storage\_account\_id | The ID of the storage account. | `string` | `"/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-test/providers/Microsoft.Storage/storageAccounts/sttest"` | no |
| container\_access\_type | The public access level of the container. | `string` | `"None"` | no |
| container\_immutable\_versioning | Enable or disable immutable storage with versioning. | `bool` | `false` | no |
| enable\_properties\_immutable\_versioning | Flag for enable properties for immutable\_versioning. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| container\_id | The ID of the created container. |
| container\_name | The name of the created container. |
| container\_type | The type of the created container. |

## Example

```hcl
module "storage_container" {
  source = "../"

  name = "stappcontainertest001"

  storage_account_id = "/subscriptions/xxxx/resourceGroups/rg-app-test-eastus-001/providers/Microsoft.Storage/storageAccounts/stapp001"

  container_access_type = "None"

  container_immutable_versioning = false

  enable_properties_immutable_versioning = false
}
```
