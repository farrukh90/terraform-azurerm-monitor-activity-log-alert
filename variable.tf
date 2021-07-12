variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created."
  type        = string
}




variable "azurerm_monitor_action_group_id" {
  description = "The name of the resource group in which the resources will be created."
  type        = string
}


variable "name" {
  description = "The name of the alert"
  type        = string
}


variable "category" {
  description = "The name of the category"
  type        = string
}


variable "operation_name" {
  description = "The name of the operation"
}


variable "webhook_properties" {
  description = "The name of the webhook_properties"
  type        = map
}
