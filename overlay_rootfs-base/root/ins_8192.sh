#!/bin/sh
insmod rtlwifi.ko
insmod rtl_usb.ko
insmod rtl8192c-common.ko
insmod rtl8192cu.ko
wpa_supplicant -Dwext -iwlan14 -c/etc/wpa_supplicant/wpa_supplicant.conf &
dhclient wlan14
