#!/bin/sh

set -euxo pipefail

docker build --progress plain --no-cache --squash -t mlupin/lambda-base-2:build-arm64 .
