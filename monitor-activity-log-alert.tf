data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

data "azurerm_monitor_action_group" "rg" {
  resource_group_name = var.resource_group_name
  name                = var.azurerm_monitor_action_group_id
}

resource "azurerm_monitor_activity_log_alert" "main" {
  name                = var.name
  resource_group_name = data.azurerm_resource_group.rg.name
  scopes              = [data.azurerm_resource_group.rg.id]
  description         = "This alert will monitor a vnet peering updates."
  criteria {
    category       = var.category
    operation_name = var.operation_name
  }
  action {
    action_group_id    = data.azurerm_monitor_action_group.rg.id
    webhook_properties = var.webhook_properties
  }
  tags = var.tags
}