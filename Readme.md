# Course-discovery-server

## This is course-discovery-server microservice of Course application.

### Main technologies:

- Gradle 7.2
- Java 17
- Spring Boot 2.5.5
- Spring Cloud 2020.0.3
- Netflix Eureka Server

### Responsibilities:

- Service discovery

## How to build:

**Regular build:**

- `./gradlew clean build`
- `docker build --network=course_local -t discovery .`
- `docker run -d -p 8761:8761 --network=course_local -h discovery --name discovery discovery`

**Without tests build:** `./gradlew clean build -x test`

**Run complete application in local docker environment:**

- Use `start_application.sh` to boot **complete** course microservices infrastructure
- And `stop_application.sh` to stop course microservices infrastructure

**Push docker image to ECR:**

- aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin
  public.ecr.aws/k7s0v3p5
- docker build -t course-discovery-server:0.0.1 .
- docker tag course-discovery-server:0.0.1 public.ecr.aws/k7s0v3p5/course-discovery-server:0.0.1
- docker push public.ecr.aws/k7s0v3p5/course-discovery-server:0.0.1
