module "caf" {
  source  = "aztfmod/caf/azurerm"
  version = "5.3.11"
  logged_user_objectId = "d58e2171-f447-480d-80b6-1a25094c3465"
  global_settings = local.global_settings
  resource_groups = local.resource_groups
  networking =  {
    vnets              = local.vnets
  }
  storage_accounts     = local.storage_accounts
  keyvaults            = local.keyvaults
  compute = {
    azure_container_registries   = local.azure_container_registries
  }
  webapp = {
    azurerm_application_insights   = local.azurerm_application_insights
  }

  database = {
    app_config                     = local.app_config
  }
}