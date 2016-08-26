#!/bin/bash


function install(){

	local readonly SRC_PATH=/usr/src
	local readonly LOCAL_PATH=/usr/local
	local readonly FILE_PATH=memcached-1.4.31
	local readonly FILE_NAME=${FILE_DIR}.tar.gz

	cd $SRC_PATH
	wget http://memcached.org/files/${FILE_NAME}
	tar -zxvf ${FILE_NAME}
	cd ${FILE_PATH}
	./configure --prefix=${LOCAL_PATH}/${FILE_PATH}
	make && make install

	cd /usr/local/bin
        ln -sf ${LOCAL_PATH}/${FILE_PATH}/bin/memcached memcached
}

function start(){
	/usr/local/memcached-1.2.0/bin/memcached -d -m 128 -l 127.0.0.1 -p 11211 -u root
}



function uninstall(){
}
