#!make
ENV:= "dev"
PROJECT_NAME:= "watson"
PREFIX:= "${ENV}-${PROJECT_NAME}"
RESOURCE_GROUP_NAME:= "${PREFIX}-infrastate-rg"
LOCATION:= 'uksouth'
STORAGE_ACCOUNT_NAME:= "${ENV}watsoninfrastatesa"
JENKINS_CONTAINER_NAME:= "${PREFIX}-jenkins-infrastate"
APP_CONTAINER_NAME:= "${PREFIX}-app-infrastate"

default: init plan

init:
	@terraform init \
		-backend-config "resource_group_name=${RESOURCE_GROUP_NAME}" \
		-backend-config "storage_account_name=${STORAGE_ACCOUNT_NAME}" \
		-backend-config "container_name=${APP_CONTAINER_NAME}"

validate:
	@terraform validate

plan:
	@terraform plan

apply:
	@terraform apply

destroy:
	@terraform destroy

