#!/bin/sh
iperf -c $1 -p 12345 -i 1 -t 10
