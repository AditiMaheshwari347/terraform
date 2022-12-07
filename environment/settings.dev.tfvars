global_settings = {
  default_region = "region1"
  regions = {
    region1 = "centralus"
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
    name = "ccare-shared-cu-dev"
  }
}

service_resource_groups = {
  service = {
    name = "ccare-service-cu-dev"
  }
}

data_resource_groups = {
  data = {
    name = "ccare-data-cu-dev"
  }
}

vnets = {
  vnet_region1 = {
    resource_group_key = "shared"
    vnet = {
      name          = "ccare-shared-cu-dev"
      address_space = ["10.1.0.0/16"]
    }
    specialsubnets = {}
    subnets = {
      sub1 = {
        name = "ccare-shared-apim-cu-dev"
        cidr = ["10.1.1.0/24"]
      }
      sub2 = {
        name = "ccare-shared-webapp-cu-dev"
        cidr = ["10.1.2.0/24"]
      }
      sub3 = {
        name = "ccare-shared-db-prv-cu-dev"
        cidr = ["10.1.3.0/24"]
      }
      sub4 = {
        name = "ccare-shared-db-pub-cu-dev"
        cidr = ["10.1.4.0/26"]
      }
      sub5 = {
        name = "ccare-shared-pe-cu-dev"
        cidr = ["10.1.5.0/26"]
      }
      sub6 = {
        name = "ccare-shared-aks-cu-dev"
        cidr = ["10.1.20.0/22"]
      }
    }
  }
}

storage_accounts = {
  sa1 = {
    name = "ccare-shared-cu-dev"
    # This option is to enable remote RG reference
    # resource_group = {
    #   lz_key = ""
    #   key    = ""
    # }

    resource_group_key = "shared"
    # Account types are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. Defaults to StorageV2
    account_kind = "BlobStorage"
    # Account Tier options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid.
    account_tier = "Standard"
    #  Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS
    account_replication_type = "LRS" # https://docs.microsoft.com/en-us/azure/storage/common/storage-redundancy
    tags = {
      environment = "dev"
      team        = "IT"
      ##
    }
    containers = {
      dev = {
        name = "random"
      }
  }
  }
}

azure_container_registries = {
  sharedacr = {
    name               = "ccare-shared-cu-dev"
    resource_group_key = "shared"
    sku                = "Basic"
    # georeplications = {
    #   region2 = {
    #     tags = {
    #       region = "australiacentral"
    #       type   = "acr_replica"
    #     }
    #   }
    #   region3 = {
    #     tags = {
    #       region = "westeurope"
    #       type   = "acr_replica"
    #     }
    #   }
    # }
  }
}

application_insights = {
  webapp = {
    name               = "ccare-shared-cu-dev"
    resource_group_key = "shared"
    application_type   = "web"
  }
}

app_config = {
  appconf1 = {
    name               = "ccare-shared-cu-dev"
    resource_group_key = "shared"
    location           = "region1"
    dynamic_settings =[]
}  
}
keyvaults = {

  #
  # Keyvault with service endpoint enabled
  #
  kv_rg1 = {
    name               = "ccare-shared-cu-dev"
    resource_group_key = "shared"
    sku_name           = "standard"

    # Make sure you set a creation policy.
    creation_policies = {
      logged_in_user = {
        secret_permissions      = ["Set", "Get", "List", "Delete", "Purge"]
        certificate_permissions = ["managecontacts", "manageissuers"]
      }
    }
  }

}