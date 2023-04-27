# Build stage
FROM maven:3.6.3-jdk-11 AS build
COPY . /app
WORKDIR /app
RUN mvn clean package -Pprod -DskipTests

# Run stage
FROM openjdk:11-jdk-slim
COPY --from=build /app/target/DogsManagementSystem-0.0.1-SNAPSHOT.jar /DogsManagementSystem.jar
CMD ["java", "-jar", "/DogsManagementSystem.jar"]
