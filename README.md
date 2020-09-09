# Microservices Platform in Azure
[![Build Status](https://dev.azure.com/pliniogsnascimento/Ecommerce-Platform/_apis/build/status/Ecommerce-Platform?branchName=develop)](https://dev.azure.com/pliniogsnascimento/Ecommerce-Platform/_build/latest?definitionId=9&branchName=develop)

This repo contains the resources to provision a kubernetes cluster and other usefull resources to build a complete platform for microservices architecure. It is focused to an ecommerce domain, design with bounded-contexts to determine great granularity between applications.

## Pre requisites

- Terraform >= 0.13
- Azure CLI >= 2.11

## Getting started
This project is built with terraform azure CLI. To get started with, create **environments/local.tfvars** file, to configure local authentication:

```
client_id="client_id"
client_secret="client_secret"
```

You can also copy the keys and change at "dev.tfvars" file to "local.tfvars".

Run the following commands to provision the infrastructure:

```
terraform plan -out out.plan -var-file=./environments/local.tfvars

terraform apply "out.plan"
```

The application also contain scripts to easily deallocate and start vmss, making it easier to avoid undesired costs.
