variable "root_id" {
  type    = string
  default = "cc"
}

variable "root_name" {
  type    = string
  default = "Centered Care Connect"
}

variable "deploy_management_resources" {
  type    = bool
  default = true
}

variable "deploy_identity_resources" {
  type    = bool
  default = true
}

variable "deploy_connectivity_resources" {
  type    = bool
  default = true
} 



variable "log_retention_in_days" {
  type    = number
  default = 50
}

variable "security_alerts_email_address" {
  type    = string
  default = "my_valid_security_contact@replace_me" # Replace this value with your own email address.
}

variable "management_resources_location" {
  type    = string
  default = "uksouth"
}