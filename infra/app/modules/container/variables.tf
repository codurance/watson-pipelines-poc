variable "prefix" {
  type        = string
  description = "The naming prefix for the resource."
}

variable "resource_group" {
  type = object({
    name     = string
    location = string
  })
  description = "Resource group information."
}

variable "container_registry" {
  type = object({
    server   = string
    username = string
    password = string
  })
  description = "Container registry information."
}

variable "name" {
  type        = string
  description = "Service name."
}

variable "ports" {
  type = list(object({
    number   = number
    protocol = string
  }))
  default     = []
  description = "Service port information."
}

variable "cpu" {
  type        = string
  description = "The number of CPU cores of the container."
  default     = "0.5"
}

variable "memory" {
  type        = string
  description = "The memory of the container in GB."
  default     = "1.5"
}

variable "dns_sidecar_cpu" {
  type        = string
  description = "The number of CPU cores of the dns sidecar container."
  default     = "0.5"
}

variable "dns_sidecar_memory" {
  type        = string
  description = "The memory of the dns sidecar container in GB."
  default     = "0.5"
}

variable "docker_image_name" {
  type        = string
  description = "The service container docker image name (without the container registry name)."
}

variable "docker_image_tag" {
  type        = string
  description = "The service container docker image tag."
  default     = "latest"
}

variable "dns_sidecar_docker_image_name" {
  type        = string
  description = "The service container docker image name (without the container registry name)."
  default     = "dns_sidecar"
}

variable "dns_sidecar_docker_image_tag" {
  type        = string
  description = "The service container docker image tag."
  default     = "latest"
}

variable "environment_variables" {
  type        = map(string)
  description = "Environment variables."
  default     = {}
}

variable "subnet_id" {
  type        = string
  description = "Subnet to deploy the service."
}

variable "dns_zone_name" {
  type        = string
  description = "Private dns zone name to register the service."
}

variable "dns_record_name" {
  type        = string
  description = "DNS record name."
}

variable "client_id" {
  type        = string
  description = "Sidecar's service principal client id."
}

variable "client_secret" {
  type        = string
  description = "Sidecar's service principal client secret."
}

variable "tenant_id" {
  type        = string
  description = "Sidecar's service principal tenant id."
}
