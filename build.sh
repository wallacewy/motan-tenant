#!/usr/bin/env bash

mvn clean package

docker_registry="10.58.9.201:5000"
docker_name="motan-tenant"
docker_tag=$(git log --format="%H" -n 1)
docker_img="$docker_registry/$docker_name:$docker_tag"

cp deploy.sh.bak deploy.sh
chmod +x deploy.sh
sed -i 's/${GIT_COMMIT}/'"$docker_tag"'/' deploy.sh

docker ps | grep $docker_img | awk '{print $1}' | xargs docker kill
docker ps -a | grep $docker_img | awk '{print $1}' | xargs docker rm
docker rmi $(docker images | grep $docker_name | grep $docker_tag | awk $'{print $3}')

docker build --force-rm=true --no-cache=true -t $docker_img .
docker push $docker_img
#Done
