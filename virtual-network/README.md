# Azure Virtual Network Module

This Terraform module creates an Azure Virtual Network.

## Usage

```hcl
module "virtual_network" {
  source = "./path/to/module"

  virtual_network_name                = var.virtual_network_name
  virtual_network_resource_group_name = var.virtual_network_resource_group_name
  virtual_network_location            = var.virtual_network_location
  virtual_network_address_space       = var.virtual_network_address_space
  virtual_network_dns_servers         = var.virtual_network_dns_servers
  virtual_network_tags                = var.virtual_network_tags
  ddos_protection_enable              = var.ddos_protection_enable
  ddos_protection_plan_id             = var.ddos_protection_plan_id
}
```

## Inputs

| Name                                | Description                                      | Type   | Default | Required |
|-------------------------------------|--------------------------------------------------|--------|---------|----------|
| `virtual_network_name`              | The name of the virtual network.                 | string | n/a     | yes      |
| `virtual_network_resource_group_name` | The name of the resource group.                | string | n/a     | yes      |
| `virtual_network_location`          | The location/region where the virtual network will be created. | string | n/a     | yes      |
| `virtual_network_address_space`     | The address space for the virtual network.       | list   | n/a     | yes      |
| `virtual_network_dns_servers`       | A list of DNS servers.                           | list   | `[]`    | no       |
| `virtual_network_tags`              | A map of tags to assign to the resource.         | map    | n/a     | no       |
| `ddos_protection_enable`            | Boolean to enable or disable DDoS protection.    | bool   | n/a     | no       |
| `ddos_protection_plan_id`           | The ID of the DDoS protection plan.              | string | n/a     | no       |

## Outputs

| Name                          | Description                                      |
|-------------------------------|--------------------------------------------------|
| `virtual_network_id`          | The ID of the created virtual network.           |
| `virtual_network_name`        | The name of the created virtual network.         |

## Example

```hcl
module "virtual_network" {
  source = "./path/to/module"

  virtual_network_name                = "example-vnet"
  virtual_network_resource_group_name = "example-rg"
  virtual_network_location            = "East US"
  virtual_network_address_space       = ["10.0.0.0/16"]
  virtual_network_dns_servers         = ["8.8.8.8", "8.8.4.4"]
  virtual_network_tags = {
    environment = "Production"
  }
  ddos_protection_enable  = true
  ddos_protection_plan_id = "example-ddos-plan-id"
}
```


