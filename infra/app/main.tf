resource "azurerm_linux_virtual_machine" "vm" {
  name                            = "${local.prefix}-vm"
  resource_group_name             = local.jenkins_rg_name
  location                        = local.jenkins_rg_location
  size                            = "Standard_D2s_v3"
  admin_username                  = "adminuser"
  admin_password                  = var.admin_password
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  custom_data = filebase64("templates/bootstrap.tftpl")

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
}
