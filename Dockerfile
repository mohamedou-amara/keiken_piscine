FROM openjdk:17-jdk

WORKDIR /app

# Copy the jar file
COPY target/week2day4exercice-0.0.1-SNAPSHOT.jar week2day4exercice-0.0.1-SNAPSHOT.jar
RUN chmod -R 777  week2day4exercice-0.0.1-SNAPSHOT.jar

# Copy the wait-for-it.sh script
COPY wait-for-it.sh wait-for-it.sh

# Change permissions for the wait-for-it.sh script
RUN chmod 777 wait-for-it.sh

# Add the USER root directive
USER root

# Start the application
CMD ["./wait-for-it.sh", "database:3306", "--", "java", "-jar", "week2day4exercice-0.0.1-SNAPSHOT.jar"]

#CMD ["java", "-jar", "week2day4exercice-0.0.1-SNAPSHOT.jar"]
