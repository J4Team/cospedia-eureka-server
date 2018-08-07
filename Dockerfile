# Base image
FROM openjdk:8-jdk-alpine

#A few environment variables are being passed through from pom.xml
ARG artifactId
ARG version
ENV ARTIFACT_ID=${artifactId}
ENV VERSION=${version}
ENV JAR_FILE=${artifactId}-${version}.jar

# Make port 8761 available to the world outside this container
EXPOSE 8761

# Add Maven dependencies to container
ADD target                                  /usr/share/${ARTIFACT_ID}/lib

#Add eureka-server jar to container
ADD target/${JAR_FILE}   /usr/share/${ARTIFACT_ID}/${JAR_FILE}

#Run the container with below magic commands!
ENTRYPOINT /usr/bin/java -jar /usr/share/${ARTIFACT_ID}/${JAR_FILE}
