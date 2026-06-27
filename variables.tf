variable "location" {
  description = "The Azure Region to deploy resources in"
  type        = string
  default     = "centralindia"
}

variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "secure-vnet"
}

variable "environment" {
  description = "The environment name (e.g. dev, stage, prod)"
  type        = string
  default     = "prod"
}

variable "owner" {
  description = "Owner tag value"
  type        = string
  default     = "akhil"
}

variable "vnet_address_space" {
  description = "The address space for the Virtual Network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "public_subnet_prefix" {
  description = "Address prefix for the public tier subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_prefix" {
  description = "Address prefix for the private application tier subnet"
  type        = string
  default     = "10.0.11.0/24"
}

variable "database_subnet_prefix" {
  description = "Address prefix for the isolated database tier subnet"
  type        = string
  default     = "10.0.21.0/24"
}

variable "bastion_subnet_prefix" {
  description = "Address prefix for Azure Bastion subnet (Must be at least /26)"
  type        = string
  default     = "10.0.100.0/26"
}

variable "enable_nat_gateway" {
  description = "Deploy a NAT Gateway for private subnet egress"
  type        = bool
  default     = true
}

variable "enable_bastion" {
  description = "Deploy Azure Bastion for secure administrative shell access"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Additional tags to apply to all resources"
  type        = map(string)
  default     = {}
}
