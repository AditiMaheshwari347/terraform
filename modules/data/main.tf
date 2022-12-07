module "caf" {
  source  = "aztfmod/caf/azurerm"
  version = "5.3.11"
  logged_user_objectId = "d58e2171-f447-480d-80b6-1a25094c3465"
  global_settings = local.global_settings
  resource_groups = local.resource_groups
}