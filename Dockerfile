FROM maven:3.6.0-jdk-11-slim AS maven
COPY ./pom.xml ./pom.xml
COPY ./src ./src
RUN mvn dependency:go-offline -B
RUN mvn clean package
FROM openjdk:8u171-jre-alpine
CMD ["java", "-jar", "./target/demo3-*.jar"]
