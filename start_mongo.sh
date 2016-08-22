#!/bin/bash

readonly MONGO_DIR=/usr/local/mongodb-linux-x86_64-rhel62-3.2.9
readonly MONGOD_CMD=$MONGO_DIR/bin/mongod
readonly MONGO_CMD=$MONGO_DIR/bin/mongo

mongod_ps=pgrep $MONGOD_CMD |wc -l
mongo_ps=pgrep $MONGO |wc -l


if $mongod_ps > 0
then
	echo "mongod is running "
else
	$MONGOD_CMD
fi

if $mongo_ps > 0
then
	echo "mongo is running"
else 
	$MONGO_CMD

fi
