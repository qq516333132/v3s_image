#import psutil
import re
import sys
import os
import time

def processinfo(name):
	pid=os.getpid()
	#print("pid=%d"%pid)
	while True:
		list = os.popen('ps a|grep '+name).read()
		#print list
		lines = list.split('\n')
		#print(lines)
		if  len(lines) >= 3:
			for line in lines:
				word = line.split()
				if len(word)>=1 and int(word[0])!= pid:
					#print('kill '+word[0])
					os.system('kill '+word[0]+' > /dev/null 2>&1')
			break
		time.sleep(1)
processinfo(sys.argv[1])
