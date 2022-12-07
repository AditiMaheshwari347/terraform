# Get the current client configuration from the AzureRM provider.
# This is used to populate the root_parent_id variable with the
# current Tenant ID used as the ID for the "Tenant Root Group"
# Management Group.

data "azurerm_client_config" "core" {}

# Declare the Azure landing zones Terraform module
# and provide a base configuration.

module "enterprise_scale" {
  source  = "Azure/caf-enterprise-scale/azurerm"
  providers = {
    azurerm              = azurerm
    azurerm.connectivity = azurerm
    azurerm.management   = azurerm
  }

  root_parent_id = data.azurerm_client_config.core.tenant_id
  root_id        = var.root_id
  root_name      = var.root_name

  deploy_connectivity_resources = var.deploy_connectivity_resources
  subscription_id_connectivity = data.azurerm_client_config.core.subscription_id
  configure_connectivity_resources =  local.configure_connectivity_resources

  deploy_management_resources   = var.deploy_management_resources
  subscription_id_management   = data.azurerm_client_config.core.subscription_id
#   configure_management_resources   = local.configure_management_resources

  deploy_identity_resources     = var.deploy_identity_resources
  subscription_id_identity     = data.azurerm_client_config.core.subscription_id
#   configure_identity_resources     = local.configure_identity_resources

  library_path = "${path.root}/lib"

  custom_landing_zones = {
    "${var.root_id}-shared-${terraform.workspace}" = {
      display_name               = "${upper(var.root_id)} Shared Landing Zone"
      parent_management_group_id = "${var.root_id}-landing-zones"
      subscription_ids           = []
      archetype_config = {
        archetype_id   = "customer_online"
        parameters     = {}
        access_control = {}
      }
    }
    "${var.root_id}-platform-${terraform.workspace}" = {
      display_name               = "${upper(var.root_id)} Platform Landing Zone"
      parent_management_group_id = "${var.root_id}-landing-zones"
      subscription_ids           = []
      archetype_config = {
        archetype_id = "customer_online"
        parameters = {
          Deny-Resource-Locations = {
            listOfAllowedLocations = ["southcentralus", ]
          }
          Deny-RSG-Locations = {
            listOfAllowedLocations = ["southcentralus", ]
          }
        }
        access_control = {}
      }
    }
    "${var.root_id}-data-${terraform.workspace}" = {
      display_name               = "${upper(var.root_id)} Data Landing Zone"
      parent_management_group_id = "${var.root_id}-landing-zones"
      subscription_ids           = []
      archetype_config = {
        archetype_id = "customer_online"
        parameters = {
          Deny-Resource-Locations = {
            listOfAllowedLocations = ["southcentralus", ]
          }
          Deny-RSG-Locations = {
            listOfAllowedLocations = ["southcentralus", ]
          }
        }
        access_control = {}
      }
    }
  }
}
