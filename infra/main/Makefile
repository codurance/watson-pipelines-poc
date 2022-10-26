#!make
export TF_VAR_environment := dev
export TF_VAR_project := watson
export TF_VAR_subscription_id := edb907a0-34b8-47cc-a65b-9ae69c0b6398

# State Variables
STATE_PREFIX := ${TF_VAR_environment}-${TF_VAR_project}
export STATE_RESOURCE_GROUP_NAME := ${STATE_PREFIX}-infrastate-rg
export STATE_LOCATION := uksouth
export STATE_STORAGE_ACCOUNT_NAME := ${TF_VAR_environment}${TF_VAR_project}infrastatesa
export STATE_CONTAINER_NAME := ${STATE_PREFIX}-infrastate
export STATE_APP_CONTAINER_NAME := ${STATE_PREFIX}-app-infrastate

default: init validate plan

build-tfstate-blob:
	./build_tfstate_blob.sh

delete-tfstate-rg:
	az group delete --name "${STATE_RESOURCE_GROUP_NAME}"

init:
	terraform init \
		-backend-config "resource_group_name=${STATE_RESOURCE_GROUP_NAME}" \
		-backend-config "storage_account_name=${STATE_STORAGE_ACCOUNT_NAME}" \
		-backend-config "container_name=${STATE_CONTAINER_NAME}"

validate:
	terraform validate

plan:
	terraform plan -out=tfplan

apply:
	terraform apply -auto-approve tfplan

destroy:
	terraform destroy -auto-approve
