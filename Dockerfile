FROM gradle:7.2-jdk11-alpine as builder
# Create and choose a workdir
RUN mkdir /home/gradle/project
WORKDIR /home/gradle/project
# Copy pom.xml to get dependencies
COPY build.gradle settings.gradle gradle.properties micronaut-cli.yml  ./
# This will resolve dependencies and cache them
RUN gradle build
# Copy sources
COPY src src
# Build app (jar will be in /usr/src/app/target/)
RUN gradle build

FROM openjdk:11-jre
COPY --from=builder /home/gradle/project/build/libs/hello-0.1-all.jar hello-0.1-all.jar
EXPOSE 8089
CMD ["java","-jar","hello-0.1-all.jar"]
