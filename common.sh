#!/bin/bash

PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:~/sbin:~/bin
export PATH

LOCAL_PATH=/usr/local
SRC_PATH=${LOCAL_PATH}/src

function isProgramInstalled(){
	_installed=`command -v $1 >/dev/null 2>&1`
	if [[ ${_installed} == ""  ]]
	then
		return 0
	else
		return 1
	fi
}

function isProgramRunning(){
	 _ps=`pgrep $MONGOD_CMD |wc -l`
	 if [ ${_ps} -eq 0 ]
	 then 
		return 1
	 else
		return 0
	 fi 
}

#isProgramInstalled vim
#echo $?
#is_installed=`isProgramInstalled vim`

#echo ${is_installed}

#running=`isProgramRunning nginx`

#echo $running


#$nginx_installed= `isProgramInstalled nginx`
#if [ $nginx_installed == 0 ]
#then
#	echo "nginx succ"
#else
#	echo "nginx fail"

#fi

#echo `isProgramInstalled nginx`

#echo `isProgramInstalled ssdb`
