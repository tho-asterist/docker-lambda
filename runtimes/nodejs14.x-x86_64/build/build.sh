#!/bin/bash

docker build --progress plain --squash -t mlupin/docker-lambda:nodejs14.x-build-x86_64 .
