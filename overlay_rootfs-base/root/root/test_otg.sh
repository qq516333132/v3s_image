#!/bin/sh
res=`ls /dev/sd*`
echo $res 
if [ "$res" = "" ]; then 
	echo "otg err!"
else
	echo "otg ok!"
fi 
