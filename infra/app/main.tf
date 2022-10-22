resource "azurerm_linux_virtual_machine" "vm" {
  name                            = "${local.prefix}-vm"
  resource_group_name             = local.jenkins_rg_name
  location                        = local.jenkins_rg_location
  size                            = var.vm_size
  admin_username                  = var.vm_admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  custom_data = filebase64("templates/bootstrap.tftpl")

  os_disk {
    caching              = var.vm_disk_caching
    storage_account_type = var.vm_disk_storage_type
  }

  source_image_reference {
    publisher = var.vm_publisher
    offer     = var.vm_offer
    sku       = var.vm_sku
    version   = var.vm_version
  }
}
