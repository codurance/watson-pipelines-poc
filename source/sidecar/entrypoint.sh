#!/bin/bash -ex

echo 0

# TODO: use restricted service principal for this
az login --service-principal \
    -u "$APP_ID" \
    -p "$APP_PASSWORD" \
    --tenant "$APP_TENANT_ID"
echo 1

ACI_IP=$(az container show \
    --name "$ACI_INSTANCE_NAME" \
    --resource-group "$RESOURCE_GROUP" \
    --query ipAddress.ip \
    --output tsv)
echo 2

# create dns a record if it does not exist
if ! az network private-dns record-set a show \
    --name "$A_RECORD_NAME" \
    --resource-group "$RESOURCE_GROUP" \
    --zone-name "$DNS_ZONE_NAME" >/dev/null 2>&1; then

    echo 3a

    az network private-dns record-set a add-record \
        --record-set-name "$A_RECORD_NAME" \
        --resource-group "$RESOURCE_GROUP" \
        --zone-name "$DNS_ZONE_NAME" \
        --ipv4-address "$ACI_IP"
else
    echo 3b

    az network private-dns record-set a update \
        --name "$A_RECORD_NAME" \
        --resource-group "$RESOURCE_GROUP" \
        --zone-name "$DNS_ZONE_NAME" \
        --set "aRecords[0].ipv4Address=$ACI_IP"
fi

echo 4

echo "Successfully updated DNS A record: '$A_RECORD_NAME' as '$ACI_IP'"
