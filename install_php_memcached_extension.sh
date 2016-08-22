#/bin/bash

SRC_PATH=/usr/local/src
FILE_NAME=memcached-2.2.0.tgz
DIR_NAME=memcached-2.2.0
PHP_DIR=/usr/local/php
MEMCACHED_DIR=/usr/local/libmemcached-1.0.18

if grep "extension=\"memcached.so\""  $PHP_DIR/etc/php.ini
then
        echo "memcached extension has been installed!"
        exit
fi
cd $SRC_PATH
if [ !-f $FILE_NAME];then
	wget http://pecl.php.net/get/$FILE_NAME
fi
if [!-d $DIR_NAME];then
	tar -zxvf $FILE_NAME
fi
cd $DIR_NAME
$PHP_DIR/bin/phpize
./configure --with-php-config=$PHP_DIR/bin/php-config --enable-memcached --with-libmemcached-dir=$MEMCACHED_DIR --disable-memcached-sasl
make && make install
 
