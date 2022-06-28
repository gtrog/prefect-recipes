variable "resource_group_name" {
  default     = "prefect_agent"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "resource_group_location" {
  default     = "eastus"
  description = "Location of the resource group."
}

variable "env_tier" {
  default     = "dev"
  description = "Tier of the environment (Dev/Stage/Test/Prod)"
}

variable "vnet_name" {
  type        = string
  default     = "prefectVnet"
  description = "Name of the Vnet to create"
}

variable "subnet_name" {
  type        = string
  default     = "prefectSubnet"
  description = "Name of the subnet to create"
}

variable "vnet_id" {
  type        = list(string)
  default     = ["10.0.0.0/16"]
  description = "IDs of the Vnets that will host the Prefect agent"
}

variable "subnet_id" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "IDs of the subnets that will host the Prefect agent"
}

variable "default_nsg" {
  description = "Standard basic NSG to allow SSH"
  type = object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  })

  default = {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

variable "prefect_url" {
  type        = string
  default     = "http://beta.prefect.io/"
  description = "URL for the Prefect Cloud API"
}

variable "api_key" {
  description = "API Key to connect. Set in terraform.tfvars."
}