# Configure the GitHub Provider
provider "github" {}

data "github_repository" "repo" {
  full_name = "GoAzure-meetup/website"
}

data "github_actions_public_key" "website" {
  repository = data.github_repository.repo.name
}

resource "github_actions_secret" "azure_static_web_apps_api_token" {
  repository      = data.github_repository.repo.name
  secret_name     = "AZURE_STATIC_WEB_APPS_API_TOKEN"
  plaintext_value = azurerm_static_site.GoAzure.api_key
}
