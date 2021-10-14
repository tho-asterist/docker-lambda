#!/usr/bin/env bash

set -euo pipefail
export DIR=$(realpath "$(dirname "${BASH_SOURCE[0]}")")

for runtime in $($DIR/get-all-runtimes.sh); do
    docker pull mlupin/docker-lambda:${runtime}-x86_64
    docker pull mlupin/docker-lambda:${runtime}-arm64
    docker pull mlupin/docker-lambda:${runtime}-build-x86_64
    docker pull mlupin/docker-lambda:${runtime}-build-arm64
done
