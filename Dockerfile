FROM maven:3.6.0-jdk-11-slim AS build
COPY ./pom.xml ./pom.xml
COPY ./src ./src
RUN mvn dependency:go-offline -B
RUN mvn clean package
FROM openjdk:8u171-jre-alpine
COPY --from= ./target/demo3*.jar ./awsdocker/demo3.jar
WORKDIR /awsdocker

CMD ["java", "-jar", "./awsdocker/demo3.jar"]
