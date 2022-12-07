global_settings = {
  default_region = "region1"
  prefix = ""

  regions = {
    region1 = "eastus"
  }
  resource_defaults = {
    virtual_machines = {
      # set the below to enable az managed boot diagostics for vms
      # this will be override if a user managed storage account is defined for the vm
      # use_azmanaged_storage_for_boot_diagnostics = true
    }
  }
}

shared_resource_groups = {
  shared = {
    name = "ccare-shared-cu-qa"
  }
}


vnets = {
  vnet_region1 = {
    resource_group_key = "shared"
    vnet = {
      name          = "ccare-shared-cu-qa"
      address_space = ["10.100.100.0/24"]
    }
    specialsubnets = {}
    subnets = {
      sub1 = {
        name = "ccare-shared-cu-qa"
        cidr = ["10.100.100.0/29"]
      }
    }

  }
}