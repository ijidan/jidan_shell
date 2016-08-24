#/bin/bash

cd /usr/local/src
wget wget http://pecl.php.net/get/memcache-2.2.6.tgz
tar -zxvf memcache-2.2.6.tgz
cd memcache-2.2.6
/usr/local/php/bin/phpize 
./configure --with-php-config=/usr/local/php/bin/php-config --enable-memcache
make make install
