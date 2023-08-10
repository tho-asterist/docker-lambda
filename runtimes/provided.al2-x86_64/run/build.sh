#!/bin/bash

set -euxo pipefail

docker build --progress plain --no-cache --squash -t mlupin/docker-lambda:provided.al2-x86_64 .
