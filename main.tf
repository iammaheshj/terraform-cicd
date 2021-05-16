#-- to maintain state
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "terraform-state-test-rg"
    storage_account_name = "odtfstate"
    container_name       = "tfstate"
    key                  = "terraform.state"
  }
  required_version = ">= 0.13"
}

resource "random_uuid" "uuid" {}

resource "azurerm_resource_group" "rg" {
  name     = "rg-hello-tf-${random_uuid.uuid.result}"
  location = var.location
}