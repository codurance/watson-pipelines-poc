FROM gradle:7.5.1-jdk8 AS builder

ADD ./app/build.gradle /app/build.gradle
ADD ./app/src /app/src

RUN cd /app && gradle clean build jar

FROM openjdk:8-jdk-alpine

COPY --from=builder /app/build/libs/app.jar /app.jar

ENV EMPLOYEES_URL_PROTOCOL="http"
ENV EMPLOYEES_URL_HOST="employees"
ENV EMPLOYEES_URL_PORT="4567"

EXPOSE 4567

ENTRYPOINT ["java", \
            "-DEMPLOYEES_URL_PROTOCOL=$EMPLOYEES_URL_PROTOCOL", \
            "-DEMPLOYEES_URL_HOST=$EMPLOYEES_URL_HOST", \
            "-DEMPLOYEES_URL_PORT=$EMPLOYEES_URL_PORT", \
            "-jar", \
            "/app.jar"]
