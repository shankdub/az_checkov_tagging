data "azurerm_resource_group" "test_vnet_rg" {
  name     = "checkov-vnet-rg"
}

resource "azurerm_virtual_network" "test_vnet_1" {
  name                = "checkov_vnet_1"
  resource_group_name = data.azurerm_resource_group.test_vnet_rg.name
  location            = data.azurerm_resource_group.test_vnet_rg.location
  address_space       = ["10.0.0.0/20"]
  # No tags
}

resource "azurerm_virtual_network" "test_vnet_2" {
  name                = "checkov_vnet_2"
  resource_group_name = data.azurerm_resource_group.test_vnet_rg.name
  location            = data.azurerm_resource_group.test_vnet_rg.location
  address_space       = ["10.0.16.0/20"]
  tags = {
    # Incorrect spelling of both
    Environment = "Development"
  }
}

resource "azurerm_virtual_network" "test_vnet_3" {
    name                = "checkov_vnet_3"
    resource_group_name = data.azurerm_resource_group.test_vnet_rg.name
    location            = data.azurerm_resource_group.test_vnet_rg.location
    address_space       = ["10.0.32.0/20"]
    tags = {
    # Correct spelling of both
    environment = "dev"
  }
}

  resource "azurerm_virtual_network" "test_vnet_4" {
    name                = "checkov_vnet_4"
    resource_group_name = data.azurerm_resource_group.test_vnet_rg.name
    location            = data.azurerm_resource_group.test_vnet_rg.location
    address_space       = ["10.0.48.0/20"]
    tags = {
    # Correct
    projectNumber = "fs00001"
  }
}

  resource "azurerm_virtual_network" "test_vnet_5" {
    name                = "checkov_vnet_5"
    resource_group_name = data.azurerm_resource_group.test_vnet_rg.name
    location            = data.azurerm_resource_group.test_vnet_rg.location
    address_space       = ["10.0.64.0/20"]
    tags = {
    # Correct
    Creator = "jsmith"
  }
}

  resource "azurerm_virtual_network" "test_vnet_6" {
    name                = "checkov_vnet_6"
    resource_group_name = data.azurerm_resource_group.test_vnet_rg.name
    location            = data.azurerm_resource_group.test_vnet_rg.location
    address_space       = ["10.0.80.0/20"]
    tags = {
    # Correct
    Creator       = "jsmith"
    projectNumber = "fs00001"
    environment   = "dev"
  }
}

  resource "azurerm_virtual_network" "test_vnet_7" {
    name                = "checkov_vnet_7"
    resource_group_name = data.azurerm_resource_group.test_vnet_rg.name
    location            = data.azurerm_resource_group.test_vnet_rg.location
    address_space       = ["10.0.96.0/20"]
    tags = merge(
      local.complete_tags,
      {
        "Name" = "my-vnet-7",
        "Description" = "To support project X"
      }
    )
  }

  resource "azurerm_virtual_network" "test_vnet_8" {
    name                = "checkov_vnet_8"
    resource_group_name = data.azurerm_resource_group.test_vnet_rg.name
    location            = data.azurerm_resource_group.test_vnet_rg.location
    address_space       = ["10.0.112.0/20"]
    tags = merge(
      local.incomplete_tags,
      {
        "Name" = "my-vnet-8",
        "Description" = "To support project X"
      }
    )
  }

  resource "azurerm_virtual_network" "test_vnet_9" {
    name                = "checkov_vnet_9"
    resource_group_name = data.azurerm_resource_group.test_vnet_rg.name
    location            = data.azurerm_resource_group.test_vnet_rg.location
    address_space       = ["10.0.128.0/20"]
    tags = merge(
      local.incomplete_tags,
      {
        "Name" = "my-vnet-9",
        "Description" = "To support project X",
         # Add missing tag directly
        "projectNumber" = "fs88884"
      }
    )
  }