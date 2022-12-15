#!/bin/bash -e

az login --service-principal \
    -u "$APP_ID" \
    -p "$APP_PASSWORD" \
    --tenant "$APP_TENANT_ID"

ACI_IP=$(az container show \
    --name "$ACI_INSTANCE_NAME" \
    --resource-group "$RESOURCE_GROUP" \
    --query ipAddress.ip \
    --output tsv)

# create dns a record if it does not exist
if ! az network private-dns record-set a show \
    --name "$A_RECORD_NAME" \
    --resource-group "$RESOURCE_GROUP" \
    --zone-name "$DNS_ZONE_NAME" >/dev/null 2>&1; then

    az network private-dns record-set a add-record \
        --record-set-name "$A_RECORD_NAME" \
        --resource-group "$RESOURCE_GROUP" \
        --zone-name "$DNS_ZONE_NAME" \
        --ipv4-address "$ACI_IP"
else

    az network private-dns record-set a update \
        --name "$A_RECORD_NAME" \
        --resource-group "$RESOURCE_GROUP" \
        --zone-name "$DNS_ZONE_NAME" \
        --set "aRecords[0].ipv4Address=$ACI_IP"
fi

echo "Successfully updated DNS A record: '$A_RECORD_NAME' as '$ACI_IP'"
