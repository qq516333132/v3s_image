#!/bin/sh
cd /root/root
#insmod led,csi
./ins_ko.sh
#earphone play tkzc.wav
./hp_test.sh &
#tp
#ts_test &
sleep 2
clear
#csi test
./test_csi.sh
#led r g b 0.5s
./led.sh 0.5 &
#otg/wifi/usba test
python test_usb.py
#ts
python test_tp.py 1
