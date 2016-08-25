#!/bin/bash

echo select your fav language:\\n
select var  in "php" "js" "java" "python"
do
	break
done

echo "your fav lang is ${var}"
