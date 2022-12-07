terraform {
  required_providers {
  }
  required_version = ">= 0.15"
}
provider "azurerm" {
  features {}

}
data "azurerm_client_config" "current" {
}
module "shared" {
    source = "./modules/shared" 
    global_settings = var.global_settings
    resource_groups = var.shared_resource_groups
    vnets           = var.vnets  
    storage_accounts = var.storage_accounts  
    azure_container_registries = var.azure_container_registries 
    azurerm_application_insights = var.application_insights 
    keyvaults = var.keyvaults
    app_config = var.app_config
}

module "service" {
    source = "./modules/service" 
    global_settings = var.global_settings
    resource_groups = var.service_resource_groups
}


module "data" {  
    source = "./modules/data" 
    global_settings = var.global_settings
    resource_groups = var.data_resource_groups
}