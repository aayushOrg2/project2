# Azure Subnet Terraform Module

This Terraform module creates an Azure Subnet with customizable settings, including address prefixes, service endpoints, and delegations.

## Usage

```hcl
module "subnet" {
  source                                      = "./path/to/module"
  name                                        = var.name
  resource_group_name                         = var.resource_group_name
  virtual_network_name                        = var.virtual_network_name
  address_prefixes                            = var.address_prefixes
  default_outbound_access_enabled             = var.default_outbound_access_enabled
  private_endpoint_network_policies           = var.private_endpoint_network_policies
  private_link_service_network_policies_enabled = var.private_link_service_network_policies_enabled
  service_endpoints                           = var.service_endpoints
  service_endpoint_policy_ids                 = var.service_endpoint_policy_ids
  delegations                                 = var.delegations
}
```

## Inputs

| Name                                          | Description                                                                 | Type          | Default       | Required |
|-----------------------------------------------|-----------------------------------------------------------------------------|---------------|---------------|----------|
| `name`                                        | The name of the subnet.                                                     | `string`      | n/a           | yes      |
| `resource_group_name`                         | The name of the resource group in which to create the subnet.               | `string`      | n/a           | yes      |
| `virtual_network_name`                        | The name of the virtual network to which to attach the subnet.              | `string`      | n/a           | yes      |
| `address_prefixes`                            | The address prefixes to use for the subnet.                                 | `list(string)`| n/a           | yes      |
| `default_outbound_access_enabled`             | Enable default outbound access to the internet for the subnet.              | `bool`        | `true`        | no       |
| `private_endpoint_network_policies`           | Enable or Disable network policies for the private endpoint on the subnet.  | `string`      | `Disabled`    | no       |
| `private_link_service_network_policies_enabled` | Enable or Disable network policies for the private link service on the subnet. | `bool`      | `true`        | no       |
| `service_endpoints`                           | The list of Service endpoints to associate with the subnet.                 | `list(string)`| `[]`          | no       |
| `service_endpoint_policy_ids`                 | The list of IDs of Service Endpoint Policies to associate with the subnet.  | `list(string)`| `[]`          | no       |
| `delegations`                                 | A list of delegation blocks.                                                | `list(object)`| `[]`          | no       |

## Outputs

| Name                                | Description                                                                 |
|-------------------------------------|-----------------------------------------------------------------------------|
| `subnet_id`                         | The ID of the subnet.                                                       |
| `subnet_name`                       | The name of the subnet.                                                     |
| `subnet_address_prefixes`           | The address prefixes of the subnet.                                         |
| `subnet_virtual_network_name`       | The name of the virtual network to which the subnet is attached.            |
| `subnet_resource_group_name`        | The name of the resource group in which the subnet is created.              |
| `subnet_service_endpoints`          | The service endpoints associated with the subnet.                           |
| `subnet_service_endpoint_policy_ids`| The IDs of the service endpoint policies associated with the subnet.        |
| `subnet_delegations`                | The delegations associated with the subnet.                                 |

## Example

```hcl
module "subnet" {
  source                                      = "./path/to/module"
  name                                        = "example-subnet"
  resource_group_name                         = "example-resource-group"
  virtual_network_name                        = "example-vnet"
  address_prefixes                            = ["10.0.1.0/24"]
  default_outbound_access_enabled             = true
  private_endpoint_network_policies           = "Disabled"
  private_link_service_network_policies_enabled = true
  service_endpoints                           = ["Microsoft.Storage"]
  service_endpoint_policy_ids                 = []
  delegations                                 = [
    {
      delegation_name = "example-delegation"
      service_delegation = {
        service_delegation_name = "Microsoft.ContainerInstance/containerGroups"
        actions                 = ["Microsoft.Network/virtualNetworks/subnets/action"]
      }
    }
  ]
}





