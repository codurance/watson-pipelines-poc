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

# Update the TFVARS

Create a `terraform.tfvars` file and fill it in with the following variables:

```bash
touch terraform.tfvars

echo "
subscription_id = \"<SUBSCRIPTION_ID>\"
" > terraform.tfvars
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

```bash
ssh -i ssh-key/key <VM_ADMIN_USERNAME>@<PUBLIC_IP>
```

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

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_virtual_machine.vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine) | resource |
| [azurerm_network_interface.nic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_network_security_group.sg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_public_ip.pip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_subnet.sub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.nsga](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_virtual_network.vn](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_prefixes"></a> [address\_prefixes](#input\_address\_prefixes) | The address prefixes of the VM subnet. | `list(string)` | <pre>[<br>  "10.0.1.0/24"<br>]</pre> | no |
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | The address space of the virtual network. | `list(string)` | <pre>[<br>  "10.0.0.0/16"<br>]</pre> | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment name. | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | The project name. | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | The Azure account subscription id. | `string` | n/a | yes |
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
| <a name="output_rg_location"></a> [rg\_location](#output\_rg\_location) | The Resource Group Location. |
| <a name="output_rg_name"></a> [rg\_name](#output\_rg\_name) | The Resource Group Name. |
| <a name="output_vn_name"></a> [vn\_name](#output\_vn\_name) | The Virtual Machine name. |
<!-- END_TF_DOCS -->

# Helper Commands

## List Available Ubuntu Images

If you decide to change the VM Ubuntu distribution, you can use the following command to find available images:

```bash
az vm image list --all --publisher Canonical
```

## Generate New SSH Key

If you would like to create a new SSH key, run the following commands:

```bash
ssh-keygen -t rsa -b 4096 -f ssh-key/key -N '' -C 'key'

chmod 400 ssh-key/key*
```

## Regenerate the Terraform Argument Reference

Use the [terraform-docs](https://terraform-docs.io/how-to/insert-output-to-file/) command to regenerate the Terraform Argument Reference if you add new variables or edit the existing ones:

```bash
terraform-docs markdown table --output-file README.md .
```
