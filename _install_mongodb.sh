#/bin/bash

readonly SRC_PATH=/usr/local/src
readonly FILE_NAME=mongodb-linux-x86_64-rhel62-3.2.9.tgz
readonly DIR_NAME=mongodb-linux-x86_64-rhel62-3.2.9
readonly LOCAL_DIR=/usr/local

cd $SRC_PATH

if [ ! -f "$FILE_NAME" ]
then
	wget https://fastdl.mongodb.org/linux/${FILE_NAME}
fi 

if [ ! -d "$LOCAL_DIR/$DIR_NAME" ]
then
	tar -zxvf $FILE_NAME -C $LOCAL_DIR
fi
 
