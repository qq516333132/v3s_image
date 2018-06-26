#!/bin/sh
trap 'echo "INTERRUPTED!";rgb_off; exit' INT 
trap 'echo "TERMED!";rgb_off; exit' TERM
rgb()
{
	echo 1 > /sys/class/leds/licheepi:red:usr/brightness
	sleep $1 
	echo 0 > /sys/class/leds/licheepi:red:usr/brightness
	echo 1 > /sys/class/leds/licheepi:green:usr/brightness
	sleep $1
	echo 0 > /sys/class/leds/licheepi:green:usr/brightness
	echo 1 > /sys/class/leds/licheepi:blue:usr/brightness
	sleep $1
	echo 0 > /sys/class/leds/licheepi:blue:usr/brightness
}

rgb_off()
{
	echo 0 > /sys/class/leds/licheepi:red:usr/brightness
	echo 0 > /sys/class/leds/licheepi:green:usr/brightness
	echo 0 > /sys/class/leds/licheepi:blue:usr/brightness
}

while true;
do
	rgb $1;
done

