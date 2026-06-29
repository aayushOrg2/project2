run "resource_group_plan" {
  command = plan

  plan "rg_plan" {
    command = plan
  }

  assert {
    condition     = length(rg_plan.resource_changes) == 1
    error_message = "Expected exactly one resource change for the resource group."
  }

  assert {
    condition     = rg_plan.resource_changes[0].type == "azurerm_resource_group"
    error_message = "The resource type is not azurerm_resource_group."
  }

  assert {
    condition     = rg_plan.resource_changes[0].change.after.name == "rg-test-dev"
    error_message = "The resource group name is not rg-test-dev."
  }

  assert {
    condition     = rg_plan.resource_changes[0].change.after.location == "Central India"
    error_message = "The resource group location is not Central India."
  }

  assert {
    condition     = rg_plan.resource_changes[0].change.after.tags["Environment"] == "Test"
    error_message = "The Environment tag is not set to Test."
  }
}
