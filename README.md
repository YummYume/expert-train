# expert-train

A SvelteKit application deployed on an Azure VM with Terraform.

## Content

- [expert-train](#expert-train)
  - [Content](#content)
  - [Setup](#setup)
  - [Deployment](#deployment)

## Setup

You need to create a SSH key with RSA if you don't already have one, and then provide the path to the private key with the `ssh_key` variable.

You need to provide the following variables, in a `terraform.tfvars` file or directly in the command line :

```bash
admin_username # The username of the admin user
admin_password # The password of the admin user (root login is disabled)
ssh_key # The path to the private key to use to connect to the VM
```

Additionnal variables can be found in the `variables.tf` file.

> [!IMPORTANT]
> You need to run `az login` before running Terraform commands to authenticate with Azure.

```bash
az login
```

## Deployment

To deploy with Terraform :

```bash
cd terraform

terraform init
terraform validate
terraform plan

# If everything is ok
terraform apply
```
