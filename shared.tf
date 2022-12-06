module "caf" {
  source  = "aztfmod/caf/azurerm"
  version = "5.3.11"
  
  global_settings = var.global_settings
  resource_groups = var.resource_groups
  logged_user_objectId = "ba112f3f-f439-414a-aff9-505d0185120e"
  
  database = {
    app_config                         = var.app_config
  }
}