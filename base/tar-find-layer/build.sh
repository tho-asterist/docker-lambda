#!/bin/sh

rm -rf layer layer.zip

docker run --rm -v "$PWD":/tmp/layer amazonlinux:2 bash -c "
  mkdir -p /tmp/layer/layer/bin
  yum install -y wget tar xz gcc make automake zip
  cd ~
  wget https://mirrors.kernel.org/gnu/findutils/findutils-4.8.0.tar.xz
  tar xJf findutils-*.tar.xz
  pushd findutils*
    ./configure
    make
    cp -a ./find/find /tmp/layer/layer/bin/
    cp -a ./xargs/xargs /tmp/layer/layer/bin/
    cp -a ./locate/updatedb /tmp/layer/layer/bin/
    cp -a ./locate/locate /tmp/layer/layer/bin/
  popd

  wget https://mirrors.kernel.org/gnu/gzip/gzip-1.9.tar.xz
  tar xJf gzip-*.tar.xz
  pushd gzip-*
    ./configure
    make
    cp -a {gzip,gzexe,gunzip,zcat,zdiff,zfgrep,zless,zmore,znew,zcmp} /tmp/layer/layer/bin/
  popd

  wget https://mirrors.kernel.org/gnu/tar/tar-1.34.tar.xz
  tar xJf tar-*.tar.xz
  pushd tar-*
    FORCE_UNSAFE_CONFIGURE=1 ./configure
    make
    cp -a src/tar /tmp/layer/layer/bin/
  popd

  pushd /tmp/layer/layer
    zip -yr /tmp/layer/layer.zip .
  popd
  # rm -rf /tmp/layer/layer
"
