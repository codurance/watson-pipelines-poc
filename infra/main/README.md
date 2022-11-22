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

# Create a Multi-Container App Service with the AZ CLI

```bash
az acr login --name devwatsonappsvccr.azurecr.io

docker build -t devwatsonappsvccr.azurecr.io/employees employees

docker build -t devwatsonappsvccr.azurecr.io/payroll payroll

docker push devwatsonappsvccr.azurecr.io/employees

docker push devwatsonappsvccr.azurecr.io/payroll

az webapp create --resource-group dev-watson-app-svc-rg --plan dev-watson-app-svc-sp --name dev-watson-app-svc --multicontainer-config-type compose --multicontainer-config-file docker-compose-app-service.yml

az webapp config container set --docker-registry-server-url devwatsonappsvccr.azurecr.io --name dev-watson-app-svc --resource-group dev-watson-app-svc-rg

az webapp delete --name dev-watson-app-svc --resource-group dev-watson-app-svc-rg --keep-empty-plan
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
| [azurerm_container_registry.cr](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry) | resource |
| [azurerm_linux_virtual_machine.vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine) | resource |
| [azurerm_network_interface.vm_nic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_network_security_group.vm_sg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_private_dns_zone.dnsprivatezone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.dnszonelink](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_public_ip.vm_pip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_service_plan.sp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan) | resource |
| [azurerm_subnet.endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.integration](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.vm_sub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.vm_nsga](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_virtual_network.vn](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | The address space of the virtual network. | `list(string)` | <pre>[<br>  "10.0.0.0/16"<br>]</pre> | no |
| <a name="input_endpoint_sub_address_prefixes"></a> [endpoint\_sub\_address\_prefixes](#input\_endpoint\_sub\_address\_prefixes) | The address prefixes of the endpoint subnet. | `list(string)` | <pre>[<br>  "10.0.100.0/24"<br>]</pre> | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment name. | `string` | n/a | yes |
| <a name="input_integration_sub_address_prefixes"></a> [integration\_sub\_address\_prefixes](#input\_integration\_sub\_address\_prefixes) | The address prefixes of the integration subnet. | `list(string)` | <pre>[<br>  "10.0.1.0/24"<br>]</pre> | no |
| <a name="input_private_dns_zone_name"></a> [private\_dns\_zone\_name](#input\_private\_dns\_zone\_name) | The name of the Private DNS Zone. Must be a valid domain name. | `string` | `"privatelink.azurewebsites.net"` | no |
| <a name="input_project"></a> [project](#input\_project) | The project name. | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | The Azure account subscription id. | `string` | n/a | yes |
| <a name="input_vm_admin_username"></a> [vm\_admin\_username](#input\_vm\_admin\_username) | The username of the local administrator used for the Virtual Machine. Changing this forces a new resource to be created. | `string` | `"adminuser"` | no |
| <a name="input_vm_disk_caching"></a> [vm\_disk\_caching](#input\_vm\_disk\_caching) | The Type of Caching which should be used for the Internal OS Disk. Possible values are None, ReadOnly and ReadWrite. | `string` | `"ReadWrite"` | no |
| <a name="input_vm_disk_storage_type"></a> [vm\_disk\_storage\_type](#input\_vm\_disk\_storage\_type) | The Storage Account Type of the Internal OS Disk. Possible values are Standard\_LRS, StandardSSD\_LRS, Premium\_LRS, StandardSSD\_ZRS and Premium\_ZRS. Changing this forces a new resource to be created. | `string` | `"Standard_LRS"` | no |
| <a name="input_vm_offer"></a> [vm\_offer](#input\_vm\_offer) | Specifies the offer of the image used to create the virtual machine. | `string` | `"0001-com-ubuntu-server-jammy"` | no |
| <a name="input_vm_publisher"></a> [vm\_publisher](#input\_vm\_publisher) | Specifies the publisher of the image used to create the virtual machine. | `string` | `"canonical"` | no |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | The SKU which should be used for the Virtual Machine, such as Standard\_F2. | `string` | `"Standard_D2s_v3"` | no |
| <a name="input_vm_sku"></a> [vm\_sku](#input\_vm\_sku) | Specifies the SKU of the image used to create the virtual machine. | `string` | `"22_04-lts-gen2"` | no |
| <a name="input_vm_sub_address_prefixes"></a> [vm\_sub\_address\_prefixes](#input\_vm\_sub\_address\_prefixes) | The address prefixes of the VM subnet. | `list(string)` | <pre>[<br>  "10.0.200.0/24"<br>]</pre> | no |
| <a name="input_vm_version"></a> [vm\_version](#input\_vm\_version) | Specifies the version of the image used to create the virtual machine. | `string` | `"latest"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_container_registry_admin_password"></a> [container\_registry\_admin\_password](#output\_container\_registry\_admin\_password) | The Container Registry admin password. |
| <a name="output_container_registry_admin_username"></a> [container\_registry\_admin\_username](#output\_container\_registry\_admin\_username) | The Container Registry admin username. |
| <a name="output_container_registry_login_server"></a> [container\_registry\_login\_server](#output\_container\_registry\_login\_server) | The Container Registry login server endpoint. |
| <a name="output_endpoint_subnet_id"></a> [endpoint\_subnet\_id](#output\_endpoint\_subnet\_id) | The endpoint subnet ID. |
| <a name="output_integration_subnet_id"></a> [integration\_subnet\_id](#output\_integration\_subnet\_id) | The integration subnet ID. |
| <a name="output_private_dns_zone_id"></a> [private\_dns\_zone\_id](#output\_private\_dns\_zone\_id) | The private DNS zone ID. |
| <a name="output_public_ip_address"></a> [public\_ip\_address](#output\_public\_ip\_address) | The Primary Public IP Address assigned to this Virtual Machine. |
| <a name="output_resource_group_location"></a> [resource\_group\_location](#output\_resource\_group\_location) | The Resource Group Location. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | The Resource Group Name. |
| <a name="output_service_plan_id"></a> [service\_plan\_id](#output\_service\_plan\_id) | The ID of the App Service plan. |
<!-- END_TF_DOCS -->

# Helper Commands

## Regenerate the Terraform Argument Reference

Use the [terraform-docs](https://terraform-docs.io/how-to/insert-output-to-file/) command to regenerate the Terraform Argument Reference if you add new variables or edit the existing ones:

```bash
terraform-docs markdown table --output-file README.md .
```
