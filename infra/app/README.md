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
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_app_service_virtual_network_swift_connection.vnintegrationconnection](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_virtual_network_swift_connection) | resource |
| [azurerm_linux_web_app.employees](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app) | resource |
| [azurerm_linux_web_app.payroll](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app) | resource |
| [azurerm_private_endpoint.privateendpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [terraform_remote_state.trs](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_employees_docker_image_name"></a> [employees\_docker\_image\_name](#input\_employees\_docker\_image\_name) | The Employees service container name. | `string` | `"employees"` | no |
| <a name="input_employees_docker_image_tag"></a> [employees\_docker\_image\_tag](#input\_employees\_docker\_image\_tag) | The Employees service container tag. | `string` | `"latest"` | no |
| <a name="input_employees_url_port"></a> [employees\_url\_port](#input\_employees\_url\_port) | The port used to connect to the Employees service. | `string` | `"80"` | no |
| <a name="input_employees_url_protocol"></a> [employees\_url\_protocol](#input\_employees\_url\_protocol) | The protocol used to connect to the Employees service. | `string` | `"http"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment name. | `string` | n/a | yes |
| <a name="input_main_remote_state_container_name"></a> [main\_remote\_state\_container\_name](#input\_main\_remote\_state\_container\_name) | The container name where the remote state lives. | `string` | n/a | yes |
| <a name="input_main_remote_state_resource_group_name"></a> [main\_remote\_state\_resource\_group\_name](#input\_main\_remote\_state\_resource\_group\_name) | The resource group name where the remote state storage account lives. | `string` | n/a | yes |
| <a name="input_main_remote_state_storage_account_name"></a> [main\_remote\_state\_storage\_account\_name](#input\_main\_remote\_state\_storage\_account\_name) | The storage account name of the remote state. | `string` | n/a | yes |
| <a name="input_payroll_docker_image_name"></a> [payroll\_docker\_image\_name](#input\_payroll\_docker\_image\_name) | The Payroll service container name. | `string` | `"payroll"` | no |
| <a name="input_payroll_docker_image_tag"></a> [payroll\_docker\_image\_tag](#input\_payroll\_docker\_image\_tag) | The Payroll service container tag. | `string` | `"latest"` | no |
| <a name="input_project"></a> [project](#input\_project) | The project name. | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | The Azure account subscribtion id. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_employees_app_svc_default_hostname"></a> [employees\_app\_svc\_default\_hostname](#output\_employees\_app\_svc\_default\_hostname) | The default hostname of the Employees App Service. |
| <a name="output_payroll_app_svc_default_hostname"></a> [payroll\_app\_svc\_default\_hostname](#output\_payroll\_app\_svc\_default\_hostname) | The default hostname of the Payroll App Service. |
<!-- END_TF_DOCS -->

# Helper Commands

## Regenerate the Terraform Argument Reference

Use the [terraform-docs](https://terraform-docs.io/how-to/insert-output-to-file/) command to regenerate the Terraform Argument Reference if you add new variables or edit the existing ones:

```bash
terraform-docs markdown table --output-file README.md .
```
