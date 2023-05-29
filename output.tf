# Output the ID of the created Log Analytics Workspace
output "workspace_id" {
  value       = azurerm_log_analytics_workspace.law.id # Use the ID from the created Log Analytics Workspace
  description = "The ID of Log Analytics Workspace"
}
