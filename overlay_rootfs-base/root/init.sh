#!/bin/sh
#init mic
#amixer -c 0 cset numid=12 2 >/root/1.txt
#connect to network
#su root -c "python /root/wifi_ctrl.py" &
cd /root/root
./led.sh 1 &
./test_tp.py 0  &
reset > /dev/tty1
./test_usb.py 

