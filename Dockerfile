# Use a base image with Java and Maven pre-installed
FROM maven:3.8.4-openjdk-11-slim AS build

# Set the working directory
WORKDIR /app

# Copy the pom.xml and install dependencies
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copy the source code
COPY src/ ./src/

# Build the application
RUN mvn package -DskipTests

# Create a new image with OpenJDK as the base
FROM openjdk:11-jre-slim

# Set the working directory
WORKDIR /app

# Copy the compiled JAR file from the previous build stage
COPY --from=build /app/target/*.jar app.jar

# Expose the necessary ports
EXPOSE 8761 8080

# Set the command to run the Eureka server and gateway
CMD ["java", "-jar", "app.jar"]
