provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "GoAzure" {
  name     = "GoAzure"
  location = "West Europe"
}

resource "azurerm_static_site" "GoAzure" {
  name                = "website"
  resource_group_name = azurerm_resource_group.GoAzure.name
  location            = "West Europe"
}

# link the static site to a custom domain
