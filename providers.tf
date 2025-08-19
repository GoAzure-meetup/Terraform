// This file contains all the providers needed.
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.38.1"
    }

    github = {
      source  = "integrations/github"
      version = "~> 6.2"
    }

    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.8"
    }
  }

  backend "remote" {
    organization = "danielpaulus"

    workspaces {
      name = "GoAzure"
    }
  }
}
