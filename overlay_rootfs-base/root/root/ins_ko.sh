#!/bin/sh
cd /lib/modules/3.4.104/kernel/drivers/
insmod leds/led-class.ko
insmod leds/leds-sunxi.ko
insmod media/video/videobuf-core.ko
insmod media/video/videobuf-dma-contig.ko
insmod media/video/sun4i_csi/device/ov7670.ko
insmod media/video/sun4i_csi/device/ov2640.ko
insmod media/video/sun4i_csi/csi0/sun4i_csi0.ko
