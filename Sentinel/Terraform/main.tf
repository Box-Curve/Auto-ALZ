# Configure the Azure provider
provider "azurerm" {
  features {} # This block is required for the AzureRM provider as of version 2.x
}

# Define a new Resource Group where Sentinel will be deployed
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name # Use variable for resource group name
  location = var.location # Use variable for Azure region
}

# Define a new Log Analytics Workspace within the above Resource Group
resource "azurerm_log_analytics_workspace" "law" {
  name                = var.workspace_name # Use variable for workspace name
  location            = azurerm_resource_group.rg.location # Use location from resource group
  resource_group_name = azurerm_resource_group.rg.name # Use name from resource group
  sku                 = var.workspace_sku # Use variable for SKU. Example - for 200GB/day commit, this should be 'PerGB2018'
  retention_in_days   = var.retention_in_days # Use variable for retention period
}

# Enable Azure Sentinel on the Log Analytics Workspace
resource "azurerm_sentinel_workspace" "sentinel" {
  workspace_id = azurerm_log_analytics_workspace.law.id # Use the ID from the created Log Analytics Workspace
}
