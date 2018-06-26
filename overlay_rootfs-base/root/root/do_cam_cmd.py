#!/usr/bin/python
import os
f = open("cam_cmd.txt")            
line = f.readline()            
while line:  
    print line,              
    os.system('i2cset -f -y 1 0x30 '+line)
    line = f.readline()  
f.close()  
os.system('i2cdump -y 1 0x30')
