run "resource_group_plan" {
  plan {
    command = plan
  }

  assert {
    condition = length(resource_changes) == 1
  }

  assert {
    condition = resource_changes[0].type == "azurerm_resource_group"
  }

  assert {
    condition = resource_changes[0].change.after.name == "rg-test-dev"
  }

  assert {
    condition = resource_changes[0].change.after.location == "Central India"
  }

  assert {
    condition = resource_changes[0].change.after.tags["Environment"] == "Test"
  }
}
