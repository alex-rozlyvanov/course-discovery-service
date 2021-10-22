
 # start discovery
docker stop discovery && docker rm discovery && docker rmi discovery
docker stop api-gateway && docker rm api-gateway && docker rmi api-gateway

cd ../course-authenticator && docker-compose down && docker-compose rm
cd ../course-manager && docker-compose down && docker-compose rm
cd ../course-journal && docker-compose down && docker-compose rm
