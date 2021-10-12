#!/bin/bash

source ${PWD}/runtimes.sh

echo -n "Enter repository passphrase: "
read -s DOCKER_CONTENT_TRUST_REPOSITORY_PASSPHRASE
echo

export DOCKER_CONTENT_TRUST=1
export DOCKER_CONTENT_TRUST_REPOSITORY_PASSPHRASE

export PUBLISH_DATE=$(date "+%Y%m%d")

docker push lambci/lambda-base
docker push lambci/lambda-base-2

for RUNTIME in $RUNTIMES; do
  echo $RUNTIME
  docker tag mlupin/docker-lambda:${RUNTIME} mlupin/docker-lambda:${PUBLISH_DATE}-${RUNTIME}
  docker push mlupin/docker-lambda:${RUNTIME}
  docker push mlupin/docker-lambda:${PUBLISH_DATE}-${RUNTIME}
  docker rmi mlupin/docker-lambda:${PUBLISH_DATE}-${RUNTIME}
done

docker push lambci/lambda-base:build
docker push lambci/lambda-base-2:build

for RUNTIME in $RUNTIMES; do
  echo build-${RUNTIME}
  docker tag mlupin/docker-lambda:build-${RUNTIME} mlupin/docker-lambda:${PUBLISH_DATE}-build-${RUNTIME}
  docker push mlupin/docker-lambda:build-${RUNTIME}
  docker push mlupin/docker-lambda:${PUBLISH_DATE}-build-${RUNTIME}
  docker rmi mlupin/docker-lambda:${PUBLISH_DATE}-build-${RUNTIME}
done
