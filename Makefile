SHELL := /bin/bash

start:
	docker-compose up -d

up:
	docker-compose up

deploy:
	export DOCKER_UID="$(id -u)"
	export DOCKER_GID="$(id -g)"
	docker-compose up --build -d

down:
	docker-compose down

scan:
	docker run --rm -e SONAR_HOST_URL=http://host.docker.internal:9000 -e SONAR_LOGIN=admin -e SONAR_PASSWORD=admin@sonarqube -v "$(PWD)":/usr/src sonarsource/sonar-scanner-cli \
		-D sonar.projectName='nestjs' \
		-D sonar.projectKey='nestjs' \
		-D sonar.token='sqp_7f6c297ed1a1a93bc5f0341b179d4830a52f10ee' \

