data "azurerm_resource_group" "rg" {
  name = var.base_rg_name
}

data "azurerm_virtual_network" "spoke-vnet" {
  name                = var.spoke_vnet_storage_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_subnet" "spoke-subnet-storage" {
  name                 = var.spoke_subnet_storage_name
  virtual_network_name = data.azurerm_virtual_network.spoke-vnet.name
  resource_group_name  = data.azurerm_resource_group.rg.name
}