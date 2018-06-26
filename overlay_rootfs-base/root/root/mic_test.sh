#!/bin/sh
arecord -D hw:0,0 -d 3 -f S16_LE /tmp/record.wav &&\
aplay -D hw:0,0 /tmp/record.wav
