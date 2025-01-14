provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "GoAzure" {
  name     = "GoAzure"
  location = "West Europe"
}

resource "azurerm_static_web_app" "GoAzure" {
  name                = "website"
  resource_group_name = azurerm_resource_group.GoAzure.name
  location            = "West Europe"
}

# link the static site to a custom domain
# For this to work we first need to create a CNAME record in Cloudflare
resource "azurerm_static_web_app_custom_domain" "wwwgoazurenl" {
  static_web_app_id = azurerm_static_web_app.GoAzure.id
  domain_name       = "www.goazure.nl"
  validation_type   = "cname-delegation"
  depends_on = [
    cloudflare_record.www
  ]
}
