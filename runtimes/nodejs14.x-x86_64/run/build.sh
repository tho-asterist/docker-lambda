#!/bin/bash

docker build --progress plain --squash -t mlupin/docker-lambda:nodejs14.x-x86_64 .
