#!/bin/bash

PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:~/sbin:~/bin
export PATH

LOCAL_PATH=/usr/local
SRC_PATH=${LOCAL_PATH}/src

function isProgramInstalled(){
	which $1
	return $?
}

function isProgramRunning(){
	 _ps=`pgrep $MONGOD_CMD |wc -l`
	 if [ ${_ps} -eq 0 ]
	 then 
		return true
	 else
		return false
	 fi 
}

$running=`isProgramRunning nginx`

echo $running


#$nginx_installed= `isProgramInstalled nginx`
#if [ $nginx_installed == 0 ]
#then
#	echo "nginx succ"
#else
#	echo "nginx fail"

#fi

#echo `isProgramInstalled nginx`

#echo `isProgramInstalled ssdb`
