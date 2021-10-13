#!/bin/bash

docker build --progress plain --squash -t mlupin/docker-lambda:python3.8-x86_64 .
