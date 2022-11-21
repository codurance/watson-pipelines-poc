#!/bin/sh

# Start SSHD
/usr/sbin/sshd

# Start the app
java \
  -DEMPLOYEES_URL_PROTOCOL="$EMPLOYEES_URL_PROTOCOL" \
  -DEMPLOYEES_URL_HOST="$EMPLOYEES_URL_HOST" \
  -DEMPLOYEES_URL_PORT="$EMPLOYEES_URL_PORT" \
  -jar /app.jar
