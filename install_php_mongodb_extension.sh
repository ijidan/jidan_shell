#/bin/bash

PHP_DIR=/usr/local/php

if grep "extension=\"mongodb.so\""  $PHP_DIR/etc/php.ini
then
        echo "memcached extension has been installed!"
        exit
fi


pecl install mongodb
echo add "extension=\"mongodb.so\"" to php.ini file

 
