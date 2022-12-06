global_settings = {
  default_region = "region1"
  regions = {
    region1 = "eastus2"
  }
  prefix = "ccare"
}

resource_groups = {
  shared = {
    name = "shared-cu-dev"
  }
}

app_config = {
  appconf1 = {
    name               = "appConf1"
    resource_group_key = "shared"
    location           = "region1"
    dynamic_settings =[]
}  
} 