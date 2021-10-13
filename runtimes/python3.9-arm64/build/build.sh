#!/bin/bash

docker build --progress plain --squash -t mlupin/docker-lambda:python3.9-build-arm64 .
