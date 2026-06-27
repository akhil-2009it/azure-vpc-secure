resource "azurerm_storage_account" "logs" {
  name                     = "secvnetlogs${var.environment}akhil" # Globally unique, 3-24 characters, numbers/lowercase only
  resource_group_name      = azurerm_resource_group.this.name
  location                 = azurerm_resource_group.this.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"

  # Enforce encrypted transit
  https_traffic_only_enabled = true

  # Restrict public network access, permitting only Private Endpoints and trusted bypasses
  network_rules {
    default_action             = "Deny"
    bypass                     = ["Logging", "Metrics", "AzureServices"]
  }

  tags = var.tags
}

# Network Watcher is provisioned automatically by Azure in a resource group named NetworkWatcherRG
data "azurerm_network_watcher" "this" {
  name                = "NetworkWatcher_${var.location}"
  resource_group_name = "NetworkWatcherRG"
}

resource "azurerm_network_watcher_flow_log" "private" {
  network_watcher_name = data.azurerm_network_watcher.this.name
  resource_group_name  = data.azurerm_network_watcher.this.resource_group_name
  name                 = "${var.project_name}-${var.environment}-private-flowlog"

  network_security_group_id = azurerm_network_security_group.private.id
  storage_account_id        = azurerm_storage_account.logs.id
  enabled                   = true

  retention_policy {
    enabled = true
    days    = 90
  }

  tags = var.tags
}
