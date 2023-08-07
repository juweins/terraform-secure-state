# Configurable variables for the Terraform deployment


# Data Source variables (Referenced by data sources)
variable "base_rg_name" {
  type = string
  description = "The name of the resource group to reference"
}

variable "kv_name" {
  type = string
  description = "The name of the key vault to reference"
}

variable "key_name" {
  type = string
  description = "The name of the key to reference"
}

variable "managed_identity"{ 
  type = string
  description = "The name of the managed identity to reference"
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
