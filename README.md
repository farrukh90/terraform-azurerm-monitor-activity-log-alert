# Usage

### This module creates Alert
```
provider "azurerm" {
  features {}
}

module "rg" {
  source   = "farrukh90/resource-group/azurerm"
  name     = "rgname"
  location = "westus2"
  tags = {
    Name        = "Alert"
    Environment = "Dev"
    Team        = "DevOps"
    Department  = "IT"
  }
}


module "actiongroup" {
  depends_on          = [module.rg]
  source              = "farrukh90/monitor-action-group/azurerm"
  resource_group_name = module.rg.name
  name                = "actiongroup"
  email_address       = "email@gmail.com"
  tags = {
    Name        = "Alert"
    Environment = "Dev"
    Team        = "DevOps"
    Department  = "IT"
  }
}



module "alerts" {
  depends_on                      = [module.rg, module.actiongroup]
  source                          = "farrukh90/monitor-activity-log-alert/azurerm"
  azurerm_monitor_action_group_id = module.actiongroup.name
  resource_group_name             = module.rg.name
  name                            = "nameasfsdaf"
  category                        = "Administrative"
  operation_name                  = "Microsoft.Network/virtualNetworks/virtualNetworkPeerings/write"
  webhook_properties = {
    from = "terraform"
  }
  tags = {
    Name        = "Alert"
    Environment = "Dev"
    Team        = "DevOps"
    Department  = "IT"
  }
}
```


### You can get the following output
```
output "all" {
  value = azurerm_monitor_activity_log_alert.main.*
}

output "id" {
  value = azurerm_monitor_activity_log_alert.main.id
}


output "name" {
  value = azurerm_monitor_activity_log_alert.main.name
}
```
