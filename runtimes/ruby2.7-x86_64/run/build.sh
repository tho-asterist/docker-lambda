#!/bin/bash

docker build --progress plain --squash -t mlupin/docker-lambda:ruby2.7-x86_64 .
