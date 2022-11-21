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
| [azurerm_app_service_virtual_network_swift_connection.vnintegrationconnection](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_virtual_network_swift_connection) | resource |
| [azurerm_container_registry.cr](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry) | resource |
| [azurerm_linux_web_app.employees](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app) | resource |
| [azurerm_linux_web_app.payroll](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app) | resource |
| [azurerm_private_dns_zone.dnsprivatezone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.dnszonelink](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_endpoint.privateendpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_service_plan.sp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan) | resource |
| [azurerm_subnet.endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.integration](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_virtual_network.vn](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | The address space of the virtual network. | `list(string)` | <pre>[<br>  "10.0.0.0/16"<br>]</pre> | no |
| <a name="input_employees_docker_image_name"></a> [employees\_docker\_image\_name](#input\_employees\_docker\_image\_name) | The Employees service container name. | `string` | `"employees"` | no |
| <a name="input_employees_docker_image_tag"></a> [employees\_docker\_image\_tag](#input\_employees\_docker\_image\_tag) | The Employees service container tag. | `string` | `"latest"` | no |
| <a name="input_employees_url_port"></a> [employees\_url\_port](#input\_employees\_url\_port) | The port used to connect to the Employees service. | `string` | `"80"` | no |
| <a name="input_employees_url_protocol"></a> [employees\_url\_protocol](#input\_employees\_url\_protocol) | The protocol used to connect to the Employees service. | `string` | `"http"` | no |
| <a name="input_endpoint_sub_address_prefixes"></a> [endpoint\_sub\_address\_prefixes](#input\_endpoint\_sub\_address\_prefixes) | The address prefixes of the endpoint subnet. | `list(string)` | <pre>[<br>  "10.0.100.0/24"<br>]</pre> | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment name. | `string` | n/a | yes |
| <a name="input_integration_sub_address_prefixes"></a> [integration\_sub\_address\_prefixes](#input\_integration\_sub\_address\_prefixes) | The address prefixes of the integration subnet. | `list(string)` | <pre>[<br>  "10.0.1.0/24"<br>]</pre> | no |
| <a name="input_payroll_docker_image_name"></a> [payroll\_docker\_image\_name](#input\_payroll\_docker\_image\_name) | The Payroll service container name. | `string` | `"payroll"` | no |
| <a name="input_payroll_docker_image_tag"></a> [payroll\_docker\_image\_tag](#input\_payroll\_docker\_image\_tag) | The Payroll service container tag. | `string` | `"latest"` | no |
| <a name="input_private_dns_zone_name"></a> [private\_dns\_zone\_name](#input\_private\_dns\_zone\_name) | The name of the Private DNS Zone. Must be a valid domain name. | `string` | `"privatelink.azurewebsites.net"` | no |
| <a name="input_project"></a> [project](#input\_project) | The project name. | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | The Azure account subscription id. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->

# Helper Commands

## Regenerate the Terraform Argument Reference

Use the [terraform-docs](https://terraform-docs.io/how-to/insert-output-to-file/) command to regenerate the Terraform Argument Reference if you add new variables or edit the existing ones:

```bash
terraform-docs markdown table --output-file README.md .
```
