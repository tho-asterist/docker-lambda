#!/bin/bash

docker build --progress plain --squash -t mlupin/docker-lambda:provided.al2-build-arm64 .
