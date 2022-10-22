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
{{ .Content }}
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
