FROM maven:3.6.0-jdk-11-slim AS build
COPY ./pom.xml ./pom.xml
COPY ./src ./src
RUN mvn dependency:go-offline -B
RUN mvn clean package
FROM openjdk:8u171-jre-alpine
WORKDIR /adevguide
COPY --from=maven target/demo-*.jar ./adevguide/demo.jar
CMD ["java", "-jar", "./adevguide/demo3.jar"]
