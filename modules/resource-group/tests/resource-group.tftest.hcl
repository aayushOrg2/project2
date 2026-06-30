run "resource_group_apply" {
  command = apply

  assert {
    condition     = output.name == "rg-test-dev"
    error_message = "The resource group name is not rg-test-dev."
  }

  assert {
    condition     = output.location == "centralindia"
    error_message = "The resource group location is not Central India."
  }

  assert {
    condition     = output.tags["Environment"] == "Test"
    error_message = "The Environment tag is not set to Test."
  }
}
