#/bin/bash


function install(){

	local readonly SRC_PATH=/usr/local/src
	local readonly FILE_NAME=mongodb-linux-x86_64-rhel62-3.2.9.tgz
	local readonly DIR_NAME=mongodb-linux-x86_64-rhel62-3.2.9
	local readonly LOCAL_DIR=/usr/local

	cd $SRC_PATH

	if [ ! -f "$FILE_NAME" ]
	then
		wget https://fastdl.mongodb.org/linux/${FILE_NAME}
	fi 

	if [ ! -d "$LOCAL_DIR/$DIR_NAME" ]
	then
		tar -zxvf $FILE_NAME -C $LOCAL_DIR
	fi
} 


function start(){
	
	readonly MONGO_DIR=/usr/local/mongodb-linux-x86_64-rhel62-3.2.9
	readonly MONGOD_CMD=$MONGO_DIR/bin/mongod
	readonly MONGO_CMD=$MONGO_DIR/bin/mongo

	mongod_ps=pgrep $MONGOD_CMD |wc -l
	mongo_ps=pgrep $MONGO |wc -l


	if $mongod_ps > 0`
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
}
