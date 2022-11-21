FROM gradle:7.5.1-jdk8 AS builder

ADD ./app/build.gradle /app/build.gradle
ADD ./app/src /app/src

RUN cd /app && gradle clean build jar

FROM openjdk:8-jdk-alpine

######################## Set up SSH

# The root password must be 'Docker!' - this is what
# Azure expectes to allow SSH access to an App Service
RUN apk add openssh \
    && echo "root:Docker!" | chpasswd

COPY sshd_config /etc/ssh/

COPY ssh_setup.sh /tmp
RUN chmod +x /tmp/ssh_setup.sh \
    && (sleep 1; /tmp/ssh_setup.sh 2>&1 > /dev/null)

# ENV SSH_PORT is required for Azure App Service
ENV SSH_PORT 2222
EXPOSE 2222

######################## Set up the app

COPY --from=builder /app/build/libs/app.jar /app.jar

# ENV PORT is required for Azure App Service
ENV PORT 4567
EXPOSE 4567

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
