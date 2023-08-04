
# Data Source variables (Referenced by data sources)
variable "base_rg_name" {
  type = string
  description = "The name of the resource group to reference"
}

variable "spoke_vnet_storage_name" {
  type = string
  description = "The name of the virtual network to reference"
}

variable "spoke_subnet_storage_name" {
  type = string
  description = "The name of the subnet to reference"
}

# Deployment variables
variable "storage_account_name" {
  type = string
  description = "The name of the storage account to create"
}

variable "storage_container_name" {
  type = string
  description = "The name of the storage container to create"
}

variable "storage_tier" {
  type = string
  description = "The storage tier to use for the storage account"
}

variable "storage_replication_type" {
  type = string
  description = "The storage replication type to use for the storage account"
}
