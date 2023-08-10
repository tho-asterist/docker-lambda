#!/bin/bash

set -euxo pipefail

docker build --progress plain --no-cache --squash -t mlupin/docker-lambda:python3.11-arm64 .
