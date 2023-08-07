# Define the necessary resources for a backend in Azure

resource "azurerm_storage_account" "sa" {
  name                            = var.storage_account_name
  resource_group_name             = data.azurerm_resource_group.rg.name
  location                        = data.azurerm_resource_group.rg.location
  account_tier                    = var.storage_tier
  account_kind                    = "StorageV2"
  account_replication_type        = var.storage_replication_type
  allow_nested_items_to_be_public = false
  enable_https_traffic_only       = true
  min_tls_version                 = "TLS1_2"

  # Enable soft delete and versioning
  blob_properties {
    delete_retention_policy {
      days = 8
    }
    restore_policy {
      days = 7
    }
    versioning_enabled  = true
    change_feed_enabled = true
  }
  # # Enable logging, since state files contain sensitive information
  # logging {
  #   version = "1.0"
  #   delete  = false
  #   read    = true
  #   write   = false
  #   retention_policy_days = 7
  # }


  identity {
    type = "UserAssigned"
    identity_ids = [
      data.azurerm_user_assigned_identity.mi.id
    ]
  }
  # Enable encryption at rest using a customer managed key
  customer_managed_key {
    key_vault_key_id          = data.azurerm_key_vault_key.cmk.id
    user_assigned_identity_id = data.azurerm_user_assigned_identity.mi.id
  }

  lifecycle {
    # Explicitly ignore changes to tags and blob_properties
    # Enable manual configuration of these properties
    ignore_changes = [
      tags,
      blob_properties
    ]
  }

  tags = {
    occasion = "Terraform Tuesday"
  }
}

resource "azurerm_storage_container" "sc" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"

}
