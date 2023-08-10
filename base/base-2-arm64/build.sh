#!/bin/bash

curl -O https://docker-lambda.s3.amazonaws.com/fs/base-2-arm64.tgz

set -euxo pipefail

docker build --progress plain --no-cache --platform linux/arm64 --squash -t mlupin/lambda-base-2:arm64 .

rm ./base-2-arm64.tgz
