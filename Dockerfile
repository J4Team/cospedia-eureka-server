# Base image
FROM openjdk:8-jdk-alpine

# Make port 8761 available to the world outside this container
EXPOSE 8761

# Add Maven dependencies to container
ADD target                                  /usr/share/eureka-server/lib

#Add eureka-server jar to container
ADD target/eureka-server-0.0.1-SNAPSHOT.jar /usr/share/eureka-server/eureka-server.jar

#Run the container with below magic commands!
ENTRYPOINT ["/usr/bin/java", "-jar",        "/usr/share/eureka-server/eureka-server.jar"]
