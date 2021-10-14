#!/bin/bash

docker build --progress plain --squash -t mlupin/docker-lambda:dotnetcore3.1-x86_64 .
