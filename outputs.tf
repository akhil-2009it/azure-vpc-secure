output "resource_group_name" {
  description = "The name of the Resource Group"
  value       = azurerm_resource_group.this.name
}

output "vnet_id" {
  description = "The ID of the Virtual Network (VNet)"
  value       = azurerm_virtual_network.this.id
}

output "public_subnet_id" {
  description = "The ID of the public tier subnet"
  value       = azurerm_subnet.public.id
}

output "private_subnet_id" {
  description = "The ID of the private application tier subnet"
  value       = azurerm_subnet.private.id
}

output "database_subnet_id" {
  description = "The ID of the isolated database tier subnet"
  value       = azurerm_subnet.database.id
}

output "key_vault_id" {
  description = "The ID of the Key Vault"
  value       = azurerm_key_vault.this.id
}

output "storage_account_id" {
  description = "The ID of the Storage Account hosting Flow Logs"
  value       = azurerm_storage_account.logs.id
}
