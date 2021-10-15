#!/usr/bin/env bash

set -euo pipefail
export DIR=$(realpath "$(dirname "${BASH_SOURCE[0]}")")

for runtime in $($DIR/get-all-runtimes.sh); do
    image="mlupin/docker-lambda:${runtime}"
    ghcr_image="ghcr.io/mlupine/docker-lambda:${runtime}"

    for arch in x86_64 arm64; do
        docker tag ${image}-${arch} ${ghcr_image}-${arch}
        docker tag ${image}-build-${arch} ${ghcr_image}-build-${arch}
        docker push ${ghcr_image}-${arch}
        docker push ${ghcr_image}-build-${arch}
    done

    docker manifest rm $ghcr_image || true
    docker manifest create --insecure $ghcr_image \
        --amend ${ghcr_image}-x86_64 \
        --amend ${ghcr_image}-arm64

    docker manifest rm ${ghcr_image}-build || true
    docker manifest create --insecure ${ghcr_image}-build \
        --amend ${ghcr_image}-build-x86_64 \
        --amend ${ghcr_image}-build-arm64

    docker manifest push --insecure ${ghcr_image}
    docker manifest push --insecure ${ghcr_image}-build
done
