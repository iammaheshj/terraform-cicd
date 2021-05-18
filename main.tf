#-- to maintain state
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
  backend "azurerm" {}
  required_version = ">= 0.13"
}

resource "random_uuid" "uuid" {}

resource "azurerm_resource_group" "rg" {
  name     = "rg-hello-terraform-${random_uuid.uuid.result}"
  location = var.location
}

resource "azurerm_resource_group" "tfrg" {
  name     = "rg-test-terraform-${random_uuid.uuid.result}"
  location = var.location
}