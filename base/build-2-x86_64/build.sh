#!/bin/sh

set -euxo pipefail

docker build --progress plain --platform linux/amd64 --no-cache --squash -t mlupin/lambda-base-2:build-x86_64 .
