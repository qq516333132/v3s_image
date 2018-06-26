#!/bin/sh
res=`ifconfig |grep wlan`
echo $res
if [ "$res" = "" ]; then
	echo  "\033[41;37m\wifi ERR! wifi ERR! wifi ERR! wifi ERR! \033[0m"
else
	echo  "\033[42;37m wifi OK! wifi OK! wifi OK! wifi OK!\033[0m"
fi
