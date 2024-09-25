resource "azurerm_resource_group" "rg_ukwest_tf" {
  name     = var.rgname
  location = var.location
}

resource "azurerm_virtual_network" "vnet_ukwest_tf" {
  name                = var.vnetname
  address_space       = var.cidrvnet.id
  location            = azurerm_resource_group.rg_ukwest_tf.location
  resource_group_name = azurerm_resource_group.rg_ukwest_tf.name
}

resource "azurerm_subnet" "subnet_ukwest_tf" {
  name                 = var.subnetname
  resource_group_name  = azurerm_resource_group.rg_ukwest_tf.name
  virtual_network_name = azurerm_virtual_network.rg_ukwest_tf.name
  address_prefixes     = var.cidrsubnet.id
}

resource "azurerm_network_interface" "rg_ukwest_tf" {
  name                = var.netinterface
  location            = azurerm_resource_group.rg_ukwest_tf.location
  resource_group_name = azurerm_resource_group.rg_ukwest_tf.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.rg_ukwest_tf.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "rg_ukwest_tf" {
  name                = var.vmname
  resource_group_name = azurerm_resource_group.rg_ukwest_tf.name
  location            = azurerm_resource_group.rg_ukwest_tf.location
  size                = var.sizevm
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.rg_ukwest_tf.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}