
docker stop discovery && docker rm discovery && docker rmi discovery
docker stop api-gateway && docker rm api-gateway && docker rmi api-gateway

cd ../course-authenticator && docker-compose down && docker-compose rm -f
cd ../course-manager && docker-compose down --remove-orphan && docker-compose rm -f
cd ../course-event-processor && docker-compose down && docker-compose rm -f
cd ../course-journal && docker-compose down && docker-compose rm -f
