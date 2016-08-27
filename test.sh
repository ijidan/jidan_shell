#!/bin/bash

_64bit="Linux localhost.localdomain 2.6.32-504.el6.x86_64 #1 SMP Wed Oct 15 04:27:16 UTC 2014 x86_64 x86_64 x86_64 GNU/Linux"
_32bit="Linux vagrant-centos62 2.6.32-573.26.1.el6.i686 #1 SMP Tue May 3 21:55:43 UTC 2016 i686 i686 i386 GNU/Linux"

echo "${_64bit}" | grep "x86_64"

echo $?

echo "${_64bit}" | grep "i386"

echo $?
