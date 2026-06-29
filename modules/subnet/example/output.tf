output "subnet_id" {
  description = "The ID of the Subnet"
  value       = module.subnet.subnet_id
}

output "subnet_name" {
  description = "The name of the Subnet"
  value       = module.subnet.subnet_name
}

output "subnet_resource_group_name" {
  description = "The resource group of the Subnet"
  value       = module.subnet.subnet_resource_group_name
}

output "subnet_virtual_network_name" {
  description = "The Virtual Network name where Subnet is created"
  value       = module.subnet.subnet_virtual_network_name
}

output "subnet_address_prefixes" {
  description = "Address prefixes of the Subnet"
  value       = module.subnet.subnet_address_prefixes
}

output "subnet_default_outbound_access_enabled" {
  description = "Default outbound access setting"
  value       = module.subnet.subnet_default_outbound_access_enabled
}

output "subnet_private_endpoint_network_policies" {
  description = "Private endpoint network policies setting"
  value       = module.subnet.subnet_private_endpoint_network_policies
}

output "subnet_private_link_service_network_policies_enabled" {
  description = "Private link service network policies"
  value       = module.subnet.subnet_private_link_service_network_policies_enabled
}

output "subnet_service_endpoints" {
  description = "Service endpoints associated with subnet"
  value       = module.subnet.subnet_service_endpoints
}

output "subnet_service_endpoint_policy_ids" {
  description = "Service endpoint policy IDs"
  value       = module.subnet.subnet_service_endpoint_policy_ids
}

output "subnet_delegations" {
  description = "Delegations configured on the subnet"
  value       = module.subnet.subnet_delegations
}