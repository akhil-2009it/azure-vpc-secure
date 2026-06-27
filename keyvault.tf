data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "this" {
  name                        = "${var.project_name}-${var.environment}-kv-akhil" # Name must be globally unique
  location                    = azurerm_resource_group.this.location
  resource_group_name         = azurerm_resource_group.this.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = true

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get", "Create", "Delete", "List", "Purge", "Recover", "Update"
    ]

    secret_permissions = [
      "Get", "Set", "Delete", "List", "Purge", "Recover"
    ]
  }

  # Enforce access only via Private Link / Allowed networks
  network_acls {
    bypass         = "AzureServices"
    default_action = "Deny"
  }

  tags = var.tags
}
