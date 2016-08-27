#!/bin/bash

info()  
{  
   cat jlb.sh
}  

res=`info`
echo "state: "$?
echo "res: "${res}
