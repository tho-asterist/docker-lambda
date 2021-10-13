#!/bin/bash

# curl -O https://docker-lambda.s3.amazonaws.com/fs/base-2-x86_64.tgz

docker build --progress plain --squash -t mlupin/lambda-base-2:x86_64 .

# rm ./base-2-x86_64.tgz
