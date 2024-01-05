#!/bin/bash

set -euxo pipefail

docker build --progress plain --squash -t mlupin/docker-lambda:nodejs20.x-build-arm64 .
