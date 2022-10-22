# Prerequisites

- Terraform
- An Azure account (your user must have Contributor permissions)
- Azure CLI
- Make

# Login Azure

Log into Azure to be able to use the `az` CLI and Terraform:

```bash
az login
```

# Create the Azure Infra with Terraform

Initialise, validate and plan the Terraform infra:

```bash
make
```

Create the environment:

```bash
make apply
```

# SSH Into the Azure VM

First, ssh into the `main` infra VM using the `main` infra ssh key and the following command:

```bash
ssh -i ssh-key/key <VM_ADMIN_USERNAME>@<PUBLIC_IP>
```

Then, while in the `main` infra VM, ssh into the `app` VM:

```bash
ssh <APP_VM_ADMIN_USERNAME>@<APP_VM_IP_OR_HOSTNAME>
```

You will be asked to provide the APP VM admin password.

# Destroy the Azure Infra

Run the following commands to destroy the environment:

```bash
make plan

make destroy
```

# Terraform Argument Reference

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.24.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.24.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_virtual_machine.vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine) | resource |
| [azurerm_network_interface.nic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_network_security_group.sg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_public_ip.pip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_subnet.sub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.nsga](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [terraform_remote_state.jrs](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_prefixes"></a> [address\_prefixes](#input\_address\_prefixes) | The address prefixes of the VM subnet. | `list(string)` | <pre>[<br>  "10.0.10.0/24"<br>]</pre> | no |
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | The VM admin password. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment name. | `string` | n/a | yes |
| <a name="input_main_remote_state_container_name"></a> [main\_remote\_state\_container\_name](#input\_main\_remote\_state\_container\_name) | The container name where the remote state lives. | `string` | n/a | yes |
| <a name="input_main_remote_state_resource_group_name"></a> [main\_remote\_state\_resource\_group\_name](#input\_main\_remote\_state\_resource\_group\_name) | The resource group name where the remote state storage account lives. | `string` | n/a | yes |
| <a name="input_main_remote_state_storage_account_name"></a> [main\_remote\_state\_storage\_account\_name](#input\_main\_remote\_state\_storage\_account\_name) | The storage account name of the remote state. | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | The project name. | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | The Azure account subscribtion id. | `string` | n/a | yes |
| <a name="input_vm_admin_username"></a> [vm\_admin\_username](#input\_vm\_admin\_username) | The username of the local administrator used for the Virtual Machine. Changing this forces a new resource to be created. | `string` | `"adminuser"` | no |
| <a name="input_vm_disk_caching"></a> [vm\_disk\_caching](#input\_vm\_disk\_caching) | The Type of Caching which should be used for the Internal OS Disk. Possible values are None, ReadOnly and ReadWrite. | `string` | `"ReadWrite"` | no |
| <a name="input_vm_disk_storage_type"></a> [vm\_disk\_storage\_type](#input\_vm\_disk\_storage\_type) | The Storage Account Type of the Internal OS Disk. Possible values are Standard\_LRS, StandardSSD\_LRS, Premium\_LRS, StandardSSD\_ZRS and Premium\_ZRS. Changing this forces a new resource to be created. | `string` | `"Standard_LRS"` | no |
| <a name="input_vm_offer"></a> [vm\_offer](#input\_vm\_offer) | Specifies the offer of the image used to create the virtual machine. | `string` | `"0001-com-ubuntu-server-jammy"` | no |
| <a name="input_vm_publisher"></a> [vm\_publisher](#input\_vm\_publisher) | Specifies the publisher of the image used to create the virtual machine. | `string` | `"canonical"` | no |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | The SKU which should be used for the Virtual Machine, such as Standard\_F2. | `string` | `"Standard_D2s_v3"` | no |
| <a name="input_vm_sku"></a> [vm\_sku](#input\_vm\_sku) | Specifies the SKU of the image used to create the virtual machine. | `string` | `"22_04-lts-gen2"` | no |
| <a name="input_vm_version"></a> [vm\_version](#input\_vm\_version) | Specifies the version of the image used to create the virtual machine. | `string` | `"latest"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_public_ip_address"></a> [public\_ip\_address](#output\_public\_ip\_address) | The Primary Public IP Address assigned to this Virtual Machine. |
<!-- END_TF_DOCS -->

# Helper Commands

## List Available Ubuntu Images

If you decide to change the VM Ubuntu distribution, you can use the following command to find available images:

```bash
az vm image list --all --publisher Canonical
```

## Regenerate the Terraform Argument Reference

Use the [terraform-docs](https://terraform-docs.io/how-to/insert-output-to-file/) command to regenerate the Terraform Argument Reference if you add new variables or edit the existing ones:

```bash
terraform-docs markdown table --output-file README.md .
```
