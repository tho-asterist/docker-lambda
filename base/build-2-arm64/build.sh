#!/bin/sh

set -euxo pipefail

docker build --progress plain --squash -t mlupin/lambda-base-2:build-arm64 .
