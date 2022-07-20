
# START authenticator
cd ../course-authenticator \
&& ./gradlew clean build -x test -x integrationTest -x contractTest \
&& docker-compose rm -f && docker-compose up -d --build

# START manager
cd ../course-manager \
&& ./gradlew clean build -x test -x integrationTest -x contractTest \
&& docker-compose rm -f && docker-compose up -d --build \
&& docker-compose -f docker-compose-kafka-simple.yml up -d

# START course-event-processor
cd ../course-event-processor \
&& ./gradlew clean build -x test -x integrationTest -x contractTest \
&& docker-compose rm -f && docker-compose up -d --build

# START journal
cd ../course-journal \
&& ./gradlew clean build -x test -x integrationTest -x contractTest \
&& docker-compose rm -f && docker-compose up -d --build

# START discovery
docker stop discovery && docker rm discovery
cd ../course-discovery-server \
&& ./gradlew clean build -x test \
&& docker build -t discovery . && docker run -d -p 8761:8761 --network=course_local -h discovery --name discovery discovery

# START api-gateway
docker stop api-gateway && docker rm api-gateway
cd ../course-api-gateway \
&& ./gradlew clean build -x test \
&& docker build -t api-gateway . && docker run -d -p 8079:8079 --network=course_local -h api-gateway --name api-gateway api-gateway
