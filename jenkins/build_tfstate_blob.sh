#!/bin/bash -ex

test -n "$RESOURCE_GROUP_NAME"
test -n "$LOCATION"
test -n "$STORAGE_ACCOUNT_NAME"
test -n "$JENKINS_CONTAINER_NAME"
test -n "$APP_CONTAINER_NAME"

# Create resource group
az group create --name "$RESOURCE_GROUP_NAME" \
    --location "$LOCATION"

# Create storage account
az storage account create \
    --resource-group "$RESOURCE_GROUP_NAME" \
    --name "$STORAGE_ACCOUNT_NAME" \
    --sku Standard_LRS \
    --encryption-services blob

# Create blob containers
az storage container create \
    --name "$JENKINS_CONTAINER_NAME" \
    --account-name "$STORAGE_ACCOUNT_NAME"

az storage container create \
    --name "$APP_CONTAINER_NAME" \
    --account-name "$STORAGE_ACCOUNT_NAME"
