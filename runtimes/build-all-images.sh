#!/usr/bin/env bash

set -euo pipefail
export DIR=$(realpath "$(dirname "${BASH_SOURCE[0]}")")

export ARCH="${1-}"

if [[ "$ARCH" != "x86_64" && "$ARCH" != "arm64" ]]; then
    echo "Usage: ./build-all-images.sh x86_64|arm64"
    exit 1
fi

for runtime in $($DIR/get-all-runtimes.sh | grep provided && $DIR/get-all-runtimes.sh | grep -v provided); do
    pushd "${DIR}/${runtime}-${ARCH}" 2>&1 >/dev/null
        for subdir in run build; do
            pushd "$subdir" 2>&1 >/dev/null
                echo "Starting ${runtime}-${ARCH}/${subdir}"
                echo "Building…"
                ./build.sh
                echo "Publishing…"
                ./publish.sh
            popd 2>&1 >/dev/null
        done
    popd 2>&1 >/dev/null
done

echo "All done!"
