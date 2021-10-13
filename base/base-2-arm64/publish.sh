#!/bin/bash

export PUBLISH_DATE=$(date "+%Y%m%d%H%M")
export BASE_IMAGE="mlupin/lambda-base-2:arm64"

docker tag ${BASE_IMAGE} ${BASE_IMAGE}-${PUBLISH_DATE}
docker push ${BASE_IMAGE}
docker push ${BASE_IMAGE}-${PUBLISH_DATE}
