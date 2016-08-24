#!/bin/bash

readonly SRC_PATH=/usr/src
readonly LOCAL_PATH=/usr/local
readonly FILE_PATH=memcached-1.4.31
readonly FILE_NAME=${FILE_DIR}.tar.gz

cd $SRC_PATH
wget http://memcached.org/files/${FILE_NAME}
tar -zxvf ${FILE_NAME}
cd ${FILE_PATH}
./configure --prefix=${LOCAL_PATH}/${FILE_PATH}
make && make install
