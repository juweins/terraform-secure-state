data "azurerm_resource_group" "rg" {
  name = var.base_rg_name
}

data "azurerm_key_vault" "kv" {
  name                = var.kv_name
  resource_group_name = var.base_rg_name
}

data "azurerm_key_vault_key" "cmk" {
  name         = var.key_name
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_user_assigned_identity" "mi" {
  name                = var.managed_identity
  resource_group_name = var.base_rg_name
}