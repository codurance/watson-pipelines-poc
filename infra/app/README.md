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
| [azurerm_linux_web_app.employees](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app) | resource |
| [azurerm_private_endpoint.privateendpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurerm_private_endpoint.vmprivateendpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | The Azure Service Principal client id. | `string` | n/a | yes |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | The Azure Service Principal client secret. | `string` | n/a | yes |
| <a name="input_container_registry_admin_password"></a> [container\_registry\_admin\_password](#input\_container\_registry\_admin\_password) | The container registry admin password from the main infra. | `string` | n/a | yes |
| <a name="input_container_registry_admin_username"></a> [container\_registry\_admin\_username](#input\_container\_registry\_admin\_username) | The container registry admin username from the main infra. | `string` | n/a | yes |
| <a name="input_container_registry_login_server"></a> [container\_registry\_login\_server](#input\_container\_registry\_login\_server) | The container registry login server from the main infra. | `string` | n/a | yes |
| <a name="input_employees_docker_image_name"></a> [employees\_docker\_image\_name](#input\_employees\_docker\_image\_name) | The Employees service container name. | `string` | `"employees"` | no |
| <a name="input_employees_docker_image_tag"></a> [employees\_docker\_image\_tag](#input\_employees\_docker\_image\_tag) | The Employees service container tag. | `string` | `"latest"` | no |
| <a name="input_endpoint_subnet_id"></a> [endpoint\_subnet\_id](#input\_endpoint\_subnet\_id) | The endpoint subnet id from the main infra. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment name. | `string` | n/a | yes |
| <a name="input_private_dns_zone_id"></a> [private\_dns\_zone\_id](#input\_private\_dns\_zone\_id) | The the private dns zone id from the main infra. | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | The project name. | `string` | n/a | yes |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | The resource group location. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The resource group name. | `string` | n/a | yes |
| <a name="input_service_plan_id"></a> [service\_plan\_id](#input\_service\_plan\_id) | The service plan ID from the main infra. | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | The Azure account subscription id. | `string` | n/a | yes |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | The Azure Service Principal tenant id. | `string` | n/a | yes |
| <a name="input_vm_subnet_id"></a> [vm\_subnet\_id](#input\_vm\_subnet\_id) | The vm subnet id from the main infra. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_employees_app_svc_default_hostname"></a> [employees\_app\_svc\_default\_hostname](#output\_employees\_app\_svc\_default\_hostname) | The default hostname of the Employees App Service. |
<!-- END_TF_DOCS -->

# Helper Commands

## Regenerate the Terraform Argument Reference

Use the [terraform-docs](https://terraform-docs.io/how-to/insert-output-to-file/) command to regenerate the Terraform Argument Reference if you add new variables or edit the existing ones:

```bash
terraform-docs markdown table --output-file README.md .
```
