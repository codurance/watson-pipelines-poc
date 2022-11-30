resource "azurerm_subnet" "vm_sub" {
  name                 = "${local.prefix}-vm-sub"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vn.name
  address_prefixes     = var.vm_sub_address_prefixes
}

resource "azurerm_network_interface" "vm_nic" {
  name                = "${local.prefix}-vm-nic"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "${local.prefix}-private"
    subnet_id                     = azurerm_subnet.vm_sub.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                            = "${local.prefix}-vm"
  resource_group_name             = var.resource_group_name
  location                        = var.resource_group_location
  size                            = var.vm_size
  admin_username                  = var.vm_admin_username
  admin_password                  = var.vm_admin_password
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.vm_nic.id,
  ]

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
