data "azurerm_subscription" "current" {}

resource "random_string" "random_suffix" {
  length = 6
  special = false
  upper = false
  numeric = true
  override_special = "_-!@#$%"
  
}
resource "azurerm_resource_group" "rg" {
  name     = "kubi-${random_string.random_suffix.result}"
  location = var.location
  lifecycle {
    ignore_changes = [tags, name]
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = [var.address_space]
  lifecycle {
    ignore_changes = [name]
  }
}

resource "azurerm_subnet" "subnet" {
  name                                           = "subnet"
  virtual_network_name                           = azurerm_virtual_network.vnet.name
  resource_group_name = azurerm_resource_group.rg.name
  address_prefixes = ["10.2.0.0/24"]
}