#!/bin/sh

set -euxo pipefail

docker build --progress plain --platform linux/arm64 --no-cache --squash -t mlupin/lambda-base-2:build-arm64 .
