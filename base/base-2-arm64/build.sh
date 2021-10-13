#!/bin/bash

curl -O https://docker-lambda.s3.amazonaws.com/fs/base-2-arm64.tgz

docker build --progress plain --squash -t mlupin/lambda-base-2:arm64 .

rm ./base-2-arm64.tgz
