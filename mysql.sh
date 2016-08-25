#!/bin/bash

PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:~/sbin:~/bin
export PATH


case $1 in 
	"install")
        
	;;
	"uninstall")
	;;
	"start")
	;;
	"restart")
	;;
	"stop")
	;;
	"reset")
	;;
	"backup")
	;;
	*)
	 	echo "option:"
	 	echo "install		install mysql"
 	 	echo "uninstall        uninstall mysql"
	 	echo "start            start mysql"
	 	echo "restart          restart mysql"
	 	echo "stop		stop mysql"
	 	echo "reset		reset mysql's root password"
	 	echo "backup		backup mysql data"
	;;
esac


