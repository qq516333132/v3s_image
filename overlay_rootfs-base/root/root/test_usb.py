#!/usr/bin/python
import os
import time

def test_usb():
#	str = os.popen('ls /dev/sd*').read()
#        if str.find('sda')<0:
	str = os.popen('lsusb').read()
        if str.find('1908')<0:
                print "\033[41;37mUSB ERR!\033[0m"
        else:   
                print "\033[42;37mUSB OK!\033[0m"

def main():
	test_usb()
main()
