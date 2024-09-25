resource "azurerm_resource_group" "RG_ukwest_tf" {
  name     = var.rgname
  location = var.location
}

resource "azurerm_virtual_network" "vnet_ukwest_tf" {
  name                = var.vnetname.name
  address_space       = var.cidrvnet.id
  location            = azurerm_resource_group.RG_ukwest_tf.location
  resource_group_name = azurerm_resource_group.RG_ukwest_tf.name
}

resource "azurerm_subnet" "subnet_ukwest_tf" {
  name                 = var.subnetname
  resource_group_name  = azurerm_resource_group.RG_ukwest_tf.name
  virtual_network_name = azurerm_virtual_network.RG_ukwest_tf.name
  address_prefixes     = var.cidrsubnet.id
}

resource "azurerm_network_interface" "RG_ukwest_tf" {
  name                = "RG_ukwest_tf-nic"
  location            = azurerm_resource_group.RG_ukwest_tf.location
  resource_group_name = azurerm_resource_group.RG_ukwest_tf.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.RG_ukwest_tf.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "RG_ukwest_tf" {
  name                = "RG_ukwest_tf-machine"
  resource_group_name = azurerm_resource_group.RG_ukwest_tf.name
  location            = azurerm_resource_group.RG_ukwest_tf.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.RG_ukwest_tf.id,
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