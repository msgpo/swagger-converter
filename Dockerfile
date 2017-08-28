FROM openjdk:8-jre-alpine

WORKDIR /oas-converter

COPY target/lib/jetty-runner.jar /oas-converter/jetty-runner.jar
COPY target/*.war /oas-converter/server.war
COPY src/main/swagger/swagger.yaml /oas-converter/swagger.yaml
COPY inflector.yaml /oas-converter/

EXPOSE 8080

CMD ["java", "-jar", "-Dconfig=/oas-converter/inflector.yaml", "-DswaggerUrl=/oas-converter/swagger.yaml", "/oas-converter/jetty-runner.jar", "/oas-converter/server.war"]

