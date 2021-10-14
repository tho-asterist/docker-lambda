#!/bin/bash

docker build --progress plain --squash -t mlupin/docker-lambda:java11-arm64 .
