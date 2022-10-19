resource "azurerm_linux_virtual_machine" "vm" {
  name                = "${local.prefix}-vm"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_D2s_v3"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("ssh-key/key.pub")
  }

  custom_data = filebase64("templates/bootstrap.tftpl")

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher= "canonical"
    offer= "0001-com-ubuntu-server-jammy"
    sku= "22_04-lts-gen2"
    version= "latest"
  }
}
