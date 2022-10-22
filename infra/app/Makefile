#!make
export TF_VAR_environment := dev
export TF_VAR_project := watson-app
export TF_VAR_subscription_id := edb907a0-34b8-47cc-a65b-9ae69c0b6398
export TF_VAR_admin_password := P4ssword

# State Variables
PREFIX := ${TF_VAR_environment}-${TF_VAR_project}
STATE_CONTAINER_NAME := ${PREFIX}-infrastate

# Remote State Variables
MAIN_PROJECT := watson
MAIN_REMOTE_STATE_PREFIX := ${TF_VAR_environment}-${MAIN_PROJECT}
export TF_VAR_main_remote_state_resource_group_name := ${MAIN_REMOTE_STATE_PREFIX}-infrastate-rg
export TF_VAR_main_remote_state_storage_account_name := ${TF_VAR_environment}${MAIN_PROJECT}infrastatesa
export TF_VAR_main_remote_state_container_name := ${MAIN_REMOTE_STATE_PREFIX}-infrastate

default: init validate plan

init:
	terraform init \
		-backend-config "resource_group_name=${TF_VAR_main_remote_state_resource_group_name}" \
		-backend-config "storage_account_name=${TF_VAR_main_remote_state_storage_account_name}" \
		-backend-config "container_name=${STATE_CONTAINER_NAME}"

validate:
	terraform validate

plan:
	terraform plan

apply:
	terraform apply

destroy:
	terraform destroy
