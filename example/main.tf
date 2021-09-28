provider "azurerm" {
  features {}
}

module "my-webapp" {
  source      = "git::https://github.com/thomisza/terraform-azure-app-service"
  rg_name     = ""
  rg_location = ""
  app_name    = ""
}
