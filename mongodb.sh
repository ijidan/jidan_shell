#/bin/bash

source ./common.sh

is64Bit
if [[ "$?" -eq "1"  ]]
then
	readonly DIR_NAME=mongodb-linux-x86_64-rhel62-3.2.9
	readonly FILE_NAME=mongodb-linux-x86_64-rhel62-3.2.9.tgz
else
	readonly DIR_NAME=mongodb-linux-i686-3.2.9
	readonly FILE_NAME=mongodb-linux-i686-3.2.9.tgz
fi
function _install(){
	isProgramInstalled mongod
	if [[ "$?" -eq "1" ]]
	then
		echo "mongodb has been installed" && exit 1
	fi	

	cd $SRC_DIR

	if [ ! -f "$FILE_NAME" ]
	then
		wget https://fastdl.mongodb.org/linux/${FILE_NAME}
	fi 

	if [ ! -d "$LOCAL_DIR/$DIR_NAME" ]
	then
		tar -zxvf $FILE_NAME -C $LOCAL_DIR
	fi

	ln -sf ${LOCAL_DIR}/bin/mongod		./mongod
	ln -sf ${LOCAL_DIR}/bin/mongo		./mongo
	ln -sf ${LOCAL_DIR}/bin/bsondump	./bsondump
	ln -sf ${LOCAL_DIR}/bin/mongodump	./mongodump
	ln -sf ${LOCAL_DIR}/bin/mongoexport	./mongoexport
	ln -sf ${LOCAL_DIR}/bin/mongofiles	./mongofiles
	ln -sf ${LOCAL_DIR}/bin/mongoimport	./mongoimport
	ln -sf ${LOCAL_DIR}/bin/mongooplog	./mongooplog
	ln -sf ${LOCAL_DIR}/bin/mongoperf	./mongoperf
	ln -sf ${LOCAL_DIR}/bin/mongorestore	./mongorestore
	ln -sf ${LOCAL_DIR}/bin/mongos		./mongos
	ln -sf ${LOCAL_DIR}/bin/mongostat	./mongostat
	ln -sf ${LOCAL_DIR}/bin/mongotop	./mongotop
}
function _uninstall(){
  echo "_uninstall"
} 

function _start(){
	
	local readonly MONGO_DIR=$LOCAL_DIR/$DIR_NAME
	local readonly  MONGOD_CMD=$MONGO_DIR/bin/mongod
	local readonly MONGO_CMD=$MONGO_DIR/bin/mongo

	mongod_ps=`pgrep $MONGOD_CMD |wc -l`
	mongo_ps=`pgrep $MONGO |wc -l`


	if [[ "${mongod_ps}" -gt "0" ]]
	then
        	echo "mongod is running "
		exit 1 
	else
        	`${MONGOD_CMD}`
	fi

	if [ "${mongo_ps}" -get "0" ]
	then
        	echo "mongo is running"
		exit 1
	else 
        	`${MONGO_CMD}`

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

