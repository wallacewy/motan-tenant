#!/usr/bin/env bash

mvn clean package

docker_img="motan-tenant"

docker ps -a | grep $docker_img | awk '{print $1}' | xargs docker rm
docker rmi $(docker images | grep $docker_img | awk $'{print $3}')

docker build --force-rm=true --no-cache=true -t $docker_img .
#Done
