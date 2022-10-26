FROM gradle:7.5.1-jdk8 AS builder

ADD ./app/build.gradle /app/build.gradle
ADD ./app/src /app/src

RUN cd /app && gradle clean build jar

FROM openjdk:8-jdk-alpine

COPY --from=builder /app/build/libs/app.jar /app.jar

EXPOSE 4567

ENTRYPOINT ["java", "-jar", "/app.jar"]
