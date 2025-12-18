terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.51.0"
    }
  }

#   backend "azurerm" {
#     resource_group_name  = "infra-rg-007"
#     storage_account_name = "infrastorageacct007"
#     container_name       = "infracontainer07"
#     key                  = "terraform.tfstate"
#   }
}

provider "azurerm" {
  features {}
  subscription_id = "9260baaf-2bcf-4ea0-8e5e-f1988eb829cb"
}
