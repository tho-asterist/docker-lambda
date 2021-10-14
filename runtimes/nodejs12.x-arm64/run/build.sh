#!/bin/bash

docker build --progress plain --squash -t mlupin/docker-lambda:nodejs12.x-arm64 .
