provider "cloudflare" {}

# Set the zone id in a variable
# This var is managed in the Terraform Cloud workspace
variable "cloudflare_zone_id" {
  type = string
}

# Create a CNAME record for the www custom domain
# Disable Cloudflare proxying for the validation to work
resource "cloudflare_record" "www" {
  zone_id         = var.cloudflare_zone_id
  name            = "www"
  content         = azurerm_static_web_app.GoAzure.default_host_name
  type            = "CNAME"
  allow_overwrite = true
  proxied         = false
}

# Redirect the non-www traffic to www with a page rule
resource "cloudflare_page_rule" "www-redirect" {
  zone_id  = var.cloudflare_zone_id
  target   = "goazure.nl/*"
  priority = 1

  actions {
    forwarding_url {
      status_code = 301
      url         = "https://www.goazure.nl/$1"
    }
  }
}
