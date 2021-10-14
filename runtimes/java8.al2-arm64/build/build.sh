#!/bin/bash

docker build --progress plain --squash -t mlupin/docker-lambda:java8.al2-build-arm64 .
