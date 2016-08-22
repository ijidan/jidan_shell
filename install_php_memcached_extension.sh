#/bin/bash

cd /usr/local/src
wget http://pecl.php.net/get/memcached-2.2.0.tgz
tar -zxvf memcached-2.2.0.tgz
cd memcached-2.2.0
/usr/local/php/bin/phpize
./configure --with-php-config=/usr/local/php/bin/php-config --enable-memcached --with-libmemcached-dir=/usr/local/libmemcached-1.0.18 --disable-memcached-sasl
make 
make install
