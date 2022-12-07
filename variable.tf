variable "global_settings" {
  default = {}
}


//Shared Zone
variable "shared_resource_groups" {
  default = {}
}

variable "vnets" { 
  default = {}
}

variable "storage_accounts" {
  default = {}
}

variable "azure_container_registries" {
  default = {}
}

variable "application_insights" {
  default = {}
}

variable "app_config" {
  default = {}
}

variable "keyvaults" {
  default = {}
}

// Service Zone
variable "service_resource_groups" {
  default = {}
}
// Data Zone
variable "data_resource_groups" {
  default = {}
}