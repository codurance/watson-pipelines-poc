# Intro

This repo contains Terraform code demonstrating the deployment of an App Service integrated in a Virtual Network.

The app service is exposed only to the virtual network via a Private Link.

A Bastion and a VM are created to access the App Service via a Private Endpoint that talks to the Private Link.

The Terraform code is split into two parts - `main` and `app`. The purpose of the split is to show that IAC can be divided into two or more parts. One part (the `main` for example) can be used by DevOps or other teams to enforce certain security and networking rules. The other part (the `app` for example) can be used by dev and QA teams to deploy the compute they need to develop, test and experiment.

The `main` Terraform script deploys the Bastion and the VM as well as the networking needed for the `app`.

The `app` Terraform script uses the state of the `main` to deploy an App Service in the same VNet as the `main`.

The services used in the `main` and the `app` could be moved from one to the other script and vice versa depending on requirements. The current setup is just an example.

# Deploy the Main Infra

```bash
cd infra/main

terraform init

terraform validate

terraform plan

terraform apply
```

# Deploy the App Infra

```bash
cd infra/app

terraform init

terraform validate

terraform plan

terraform apply
```

# Resource Architecture

The following Azure Resources will be deployed after running the `main` and `app` Terraform scripts:

![Azure Infra](docs/infra.jpg)

# Destroy the App Infra

```bash
cd infra/app

terraform validate

terraform plan -destroy

terraform apply
```

# Destroy the Main Infra

```bash
cd infra/main

terraform validate

terraform plan -destroy

terraform apply
```

# Resources

- [Azure Private Endpoint DNS configuration](https://learn.microsoft.com/en-us/azure/private-link/private-endpoint-dns)
- [Create two web apps connected securely with Private Endpoint and VNet integration](https://learn.microsoft.com/en-us/azure/app-service/scripts/terraform-secure-backend-frontend)
- [Open an SSH session to a Linux container in Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/configure-linux-open-ssh-session)
- [Using Private Endpoints for Azure Web App](https://learn.microsoft.com/en-us/azure/app-service/networking/private-endpoint)
