#!/bin/bash

set -euxo pipefail

export PUBLISH_DATE=$(date "+%Y%m%d%H%M")
export NO_ARCH_TAG="mlupin/docker-lambda:nodejs20.x"
export BASE_IMAGE="${NO_ARCH_TAG}-x86_64"

docker tag ${BASE_IMAGE} ${BASE_IMAGE}-${PUBLISH_DATE}
docker push ${BASE_IMAGE}
docker push ${BASE_IMAGE}-${PUBLISH_DATE}
