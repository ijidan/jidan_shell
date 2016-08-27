#/bin/bash

source ./common.sh

function _install(){
	isProgramInstalled mongod
	if [[ "$?" -eq "1" ]]
	then
		echo "mongodb has been installed" && exit 1
	fi	
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

function _uninstall(){
  echo "_uninstall"
} 

function _start(){
	
	local readonly MONGO_DIR=/usr/local/mongodb-linux-x86_64-rhel62-3.2.9
	local readonly  MONGOD_CMD=$MONGO_DIR/bin/mongod
	local readonly MONGO_CMD=$MONGO_DIR/bin/mongo

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
}

function _stop(){
	 echo "_stop"
}

case $1 in
        "install")
                _install;;
        "uninstall")
                _uninstall;;
        "start")
                _start;;
        "stop")
                _stop;;
        *)
                echo "option:"
                echo "install           install mongodb"
                echo "uninstall         uninstall mongdb "
                echo "start             start mongodb as daemon"
                echo "stop              stop mongdb"
esac















