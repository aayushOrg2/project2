module "resource_group" {

  source = "../"

  name     = "rg-test-dev"
  location = "Central India"

  tags = {
    Environment = "Test"
    Owner       = "Terraform"
  }

}
