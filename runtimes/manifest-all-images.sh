#!/usr/bin/env bash

set -euo pipefail
export DIR=$(realpath "$(dirname "${BASH_SOURCE[0]}")")

for runtime in $($DIR/get-all-runtimes.sh); do
    image="mlupin/docker-lambda:${runtime}"

    docker manifest rm $image || true
    docker manifest create $image \
        --amend ${image}-x86_64 \
        --amend ${image}-arm64

    docker manifest rm ${image}-build || true
    docker manifest create ${image}-build \
        --amend ${image}-build-x86_64 \
        --amend ${image}-build-arm64

    docker manifest push ${image}
    docker manifest push ${image}-build
done
