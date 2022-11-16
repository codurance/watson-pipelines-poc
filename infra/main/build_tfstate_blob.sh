#!/bin/bash -ex

test -n "$STATE_RESOURCE_GROUP_NAME"
test -n "$STATE_LOCATION"
test -n "$STATE_STORAGE_ACCOUNT_NAME"
test -n "$STATE_CONTAINER_NAME"
test -n "$STATE_APP_CONTAINER_NAME"

# Create resource group
az group create --name "$STATE_RESOURCE_GROUP_NAME" \
  --location "$STATE_LOCATION"

# Create storage account
az storage account create \
  --resource-group "$STATE_RESOURCE_GROUP_NAME" \
  --name "$STATE_STORAGE_ACCOUNT_NAME" \
  --sku Standard_LRS \
  --encryption-services blob

# Create blob containers
az storage container create \
  --name "$STATE_CONTAINER_NAME" \
  --account-name "$STATE_STORAGE_ACCOUNT_NAME"

az storage container create \
  --name "$STATE_APP_CONTAINER_NAME" \
  --account-name "$STATE_STORAGE_ACCOUNT_NAME"

az storage container create \
  --name "$STATE_APP_SVC_CONTAINER_NAME" \
  --account-name "$STATE_STORAGE_ACCOUNT_NAME"
