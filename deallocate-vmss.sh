#!/bin/bash
RESOURCE_GROUP=$(az vmss list --query '[].resourceGroup' -o tsv)
VMSS_NAME=$(az vmss list --query '[].name' -o tsv)

az vmss deallocate --resource-group $RESOURCE_GROUP --name $VMSS_NAME
