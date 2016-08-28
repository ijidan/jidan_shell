#!/bin/bash

PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:~/sbin:~/bin
export PATH

readonly LOCAL_DIR=/usr/local
readonly SRC_DIR=${LOCAL_DIR}/src
readonly LOCAL_BIN_DIR=${LOCAL_DIR}/bin

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

function is64Bit(){
	uname -a | grep "x86_64" 
	if [[ "$?" -eq "0" ]]
	then
		return 1
	else
		return 0
	fi
}
function makeDir(){
	if [ ! -d $1 ]
	then
		mkdir -r $1
	fi
}
function makeFile(){
	if [ ! -f $1 ]
	then
		touch $1
	fi
}
