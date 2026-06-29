run "resource_group_plan" {
  command = plan

  assert {
    condition     = length(run.resource_group_plan.plan.resource_changes) == 1
    error_message = "Resource count mismatch"
  }

  assert {
    condition     = run.resource_group_plan.plan.resource_changes[0].type == "azurerm_resource_group"
    error_message = "Resource type is not azurerm_resource_group"
  }

  assert {
    condition     = run.resource_group_plan.plan.resource_changes[0].change.after.name == "rg-test-dev"
    error_message = "Resource name mismatch"
  }

  assert {
    condition     = run.resource_group_plan.plan.resource_changes[0].change.after.location == "Central India"
    error_message = "Location mismatch"
  }

  assert {
    condition     = run.resource_group_plan.plan.resource_changes[0].change.after.tags["Environment"] == "Test"
    error_message = "Tags mismatch"
  }
}
