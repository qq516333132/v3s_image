#!/bin/sh
sudo dd if=/dev/zero of=$1 bs=1024 seek=8 count=512 &&\
sudo dd if=u-boot-sunxi-with-spl_480800.bin of=$1 bs=1024 seek=8 &&\
sync
