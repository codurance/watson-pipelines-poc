FROM openjdk:8-jdk-alpine

COPY app/build/libs/app.jar /app.jar

EXPOSE 4567

ENTRYPOINT ["java", "-jar", "/app.jar"]
