FROM openjdk:8-jdk-alpine
LABEL maintainer="raviggajjar@gmail.com"

EXPOSE 8080
ARG JAR_FILE=target/helloworld-0.0.1-SNAPSHOT.jar

# Add the application's jar to the container
ADD ${JAR_FILE} helloworld-0.0.1-SNAPSHOT.jar

# Run the jar file 
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/helloworld-0.0.1-SNAPSHOT.jar"]
