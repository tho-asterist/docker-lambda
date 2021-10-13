#!/bin/bash

CMD="BUILD_ONLY=true npm install --build-from-source \
    bcrypt \
    bignum \
    grpc \
    hiredis \
    iconv \
    kerberos \
    leveldown \
    murmurhash-native \
    node-cmake \
    serialport \
    snappy \
    sqlite3 \
    unix-dgram \
    v8-profiler \
    websocket \
    webworker-threads \
    x509 \
    node-sass
"

docker run --rm \
  -e PATH=/var/lang/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/bin \
  -e LD_LIBRARY_PATH=/var/lang/lib:/lib64:/usr/lib64:/var/runtime:/var/runtime/lib:/var/task:/var/task/lib:/opt/lib \
  -e AWS_EXECUTION_ENV=AWS_Lambda_nodejs12.x \
  -e NODE_PATH=/var/runtime:/var/task:/var/runtime/node_modules \
  -e npm_config_unsafe-perm=true \
  mlupin/lambda-base:build-x86_64 sh -c "$CMD" && echo "Success!"
