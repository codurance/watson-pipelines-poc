#!/bin/bash

set -e -o pipefail

print_help() {
  echo "Script usage: $(basename "$0") [-r] <acr_registry_name|acr_registry_login_server>" >&2
}

if [ $# = 0 ]; then
  print_help
  exit 1
fi

while getopts 'r:' OPTION; do
  case "$OPTION" in
  r)
    REGISTRY="${OPTARG%'.azurecr.io'}"
    if [ -z "$REGISTRY" ]; then
      print_help
      exit 1
    fi
    ;;
  *)
    print_help
    exit 1
    ;;
  esac
done

acr_login() {
  registry="$1"

  az acr login -n "$registry"
}

build_image() {
  path="$1"
  tag="$2"

  docker build -t "$tag" "$path"
  docker push "$tag"
  docker rmi "$tag"
}

echo "Authetication with azure container registry '$REGISTRY' ..."
acr_login "$REGISTRY"

echo "Building images..."
build_image "$(dirname "$0")/employees" "$REGISTRY.azurecr.io/employees"
build_image "$(dirname "$0")/payroll" "$REGISTRY.azurecr.io/payroll"
build_image "$(dirname "$0")/dns_sidecar" "$REGISTRY.azurecr.io/dns_sidecar"
