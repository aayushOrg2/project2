run "resource_group_apply" {
  command = apply

  assert {
    condition     = azurerm_resource_group.rg-test-dev.name == "rg-test-dev"
    error_message = "The resource group name is not rg-test-dev."
  }

  assert {
    condition     = azurerm_resource_group.rg-test-dev.location == "Central India"
    error_message = "The resource group location is not Central India."
  }

  assert {
    condition     = azurerm_resource_group.rg-test-dev.tags["Environment"] == "Test"
    error_message = "The Environment tag is not set to Test."
  }
}
