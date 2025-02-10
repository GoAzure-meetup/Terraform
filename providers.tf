// This file contains all the providers needed.
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.18.0"
    }

    github = {
      source  = "integrations/github"
      version = "~> 6.2"
    }

    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.40"
    }
  }

  backend "remote" {
    organization = "danielpaulus"

    workspaces {
      name = "GoAzure"
    }
  }
}
