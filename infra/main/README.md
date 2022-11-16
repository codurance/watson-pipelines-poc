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
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_service_plan.sp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | The environment name. | `string` | n/a | yes |
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
