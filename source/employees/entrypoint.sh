#!/bin/sh

# Start SSHD
/usr/sbin/sshd

# Start the app
java -jar /app.jar
