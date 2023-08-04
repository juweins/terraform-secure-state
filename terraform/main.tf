# Define the necessary resources for a backend in Azure

resource "azurerm_storage_account" "sa" {
  name                      = var.storage_account_name
  resource_group_name       = data.azurerm_resource_group.rg.name
  location                  = data.azurerm_resource_group.rg.location
  account_tier              = var.storage_tier
  account_replication_type  = var.storage_replication_type
  enable_https_traffic_only = true
  min_tls_version           = "TLS1_2"
}

resource "azurerm_storage_container" "sc" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}

# Define a Network Security Group (NSG) to allow HTTPS traffic

# resource "azurerm_network_security_group" "storage_nsg" {
#   name                = "tfstate-nsg"
#   resource_group_name = data.azurerm_resource_group.rg.name
#   location            = data.azurerm_resource_group.rg.location


#   security_rule {
#     name                       = "allow-https"
#     priority                   = 100
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "443"
#     source_address_prefix      = "*"
#   }
# }

# # Attach the NSG to the storage account
# # Only workstation IP address can access the storage account
