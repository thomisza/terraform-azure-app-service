
resource "azurerm_app_service_plan" "main" {
  name                = "zath-service-plan"
  location            = var.rg_location
  resource_group_name = var.rg_name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "main" {
  name                = var.app_name
  location            = var.rg_location
  resource_group_name = var.rg_name
  app_service_plan_id = azurerm_app_service_plan.main.id

  site_config {
    linux_fx_version         = "DOTNETCORE|3.1"
    scm_type                 = "LocalGit"
  }

  identity {
    type = "SystemAssigned"
  }
}
