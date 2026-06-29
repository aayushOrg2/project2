run "resource_group_plan" {
  command = plan

  variables {
    name     = "rg-test-dev"
    location = "Central India"
    tags     = { Environment = "Test" }
  }


  assert {
    condition     = output.resource_group_name == "rg-test-dev"
    error_message = "Resource Group"
  }

  assert {
    condition     = output.resource_group_location == "Central India"
    error_message = "Location"
  }

  assert {
    condition     = output.resource_group_tags["Environment"] == "Test"
    error_message = "Tags"
  }
}
