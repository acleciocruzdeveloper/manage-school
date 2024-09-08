FROM openjdk:11-jdk-alpine AS builder

COPY . /app

WORKDIR /app
RUN mvn package

FROM openjdk:17-jdk-alpine

COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","/app.jar"]