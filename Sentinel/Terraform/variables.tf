# Variable to hold the name of the Resource Group to be created
variable "resource_group_name" {
  description = "The name of the resource group in which resources are created"
  type        = string
}

# Variable to hold the Azure location/region where resources will be created
variable "location" {
  description = "The location/region in which resources are created"
  type        = string
}

# Variable to hold the name of the Log Analytics Workspace to be created
variable "workspace_name" {
  description = "The name of the Log Analytics Workspace"
  type        = string
}

# Variable to hold the SKU for the Log Analytics Workspace. 
# For a 200GB/day commitment, use 'PerGB2018'
variable "workspace_sku" {
  description = "The SKU of the Log Analytics Workspace"
  type        = string
  default     = "PerGB2018"
}

# Variable to hold the data retention period in days for the Log Analytics Workspace
variable "retention_in_days" {
  description = "The retention period in days. Minimum is 30, maximum is 730"
  type        = number
  default     = 30
}
