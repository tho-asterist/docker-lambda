#!/bin/bash

docker build --progress plain --squash -t mlupin/docker-lambda:nodejs14.x-arm64 .
