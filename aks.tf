resource "azurerm_resource_group" "aks_resource_group" {
  name     = var.resource_group_name
  location = var.location
}

module "network" {
  source              = "Azure/network/azurerm"
  resource_group_name = azurerm_resource_group.aks_resource_group.name
  address_space       = "10.0.0.0/16"
  subnet_prefixes     = ["10.0.1.0/24"]
  subnet_names        = ["subnet1"]
  depends_on          = [azurerm_resource_group.aks_resource_group]
}

module "aks" {
  source                          = "Azure/aks/azurerm"
  resource_group_name             = azurerm_resource_group.aks_resource_group.name
  client_id                       = var.client_id
  client_secret                   = var.client_secret
  prefix                          = var.prefix
  agents_count                    = var.agents_count
  agents_size                     = var.agents_size
  enable_http_application_routing = true

  depends_on = [
      azurerm_resource_group.aks_resource_group
  ]

  version = "4.0.0"
}