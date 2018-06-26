#!/bin/sh
trap 'echo "INTERRUPTED!";sync;exit' INT 
trap 'echo "TERMED!";sync; exit' TERM
rm /tmp/gpio.log
while true;
do
	./mmap r 01c20848 36 >> /tmp/gpio.log
done
