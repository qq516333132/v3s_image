#!/bin/sh
#./ins_ko.sh
rm image.png
fswebcam --no-banner -d /dev/video0 -r 640x480 --png 5 image.png
if [ $? -eq 0 ]; then
	./disp_png.sh
else
	echo  "\033[41;37m\csi ERR! csi ERR! csi ERR! csi ERR! \033[0m"
fi
#dmesg |tail -n 30
#./rmcsi.sh
