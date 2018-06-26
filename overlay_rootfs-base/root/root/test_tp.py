#!/usr/bin/python
import signal
import os,sys,subprocess

def quit(signum, frame):
	print 'stop tp test.'
	os.kill(os.getpid(),signal.SIGKILL)

def cal_x_y(x,y,flag):
	w = 800/8
	h = 480/16
	_x = int(x*w/4096.0)
	_y = int(y*h/4096.0)
	if flag !=0 :
		_x = w-_x
	return _x,_y

def draw_ch(x,y,flag,ch):
	_x,_y = cal_x_y(x,y,flag)
	print("\033[%d;%dH"%(_y,_x)),
	print ch

class Shell(object):
	def __init__(self, cmd):
		self.cmd = cmd
		self.ret_code = None
		self.ret_info = None
		self.err_info = None
		self.t0=0
		self.t1=1
		self.state=0

	def run_background(self):
		self._process = subprocess.Popen(self.cmd, shell=True,
		stdout=subprocess.PIPE, stderr=subprocess.PIPE)

	def get_status(self):
		retcode = self._process.poll()
		if retcode == None:
			status = "RUNNING"
		else:
			status = "FINISHED"
		return status
	def det_key(self, flag):                                    
		x0=0
		x=0
		y=0
		y0=0
		while True:                                   
			line = self._process.stdout.readline()              
			if line.find("EV_ABS")>=0:                          
				#type 3 (EV_ABS), code 0 (ABS_X), value 1874
				#code:0 val:1874    
				line.replace(',','')
				#print line              
				tmp=line.split()    
				#print tmp
				if len(tmp)>=10:        
					code = int(tmp[7])      #352
					val = int(tmp[10])      #1/0
					#print code,val   
					if code == 0:
						x0=x
						x=val
					elif code == 1:
						y0=y
						y=val
						if (y>y0 and x>x0) or (y<y0 and x <x0):
							ch='/' if flag==0 else '\\'
						elif (y>y0 and x<x0) or (y>y0 and x <x0):
							ch='\\' if flag==0 else '/'
						elif y==y0:
							ch='-'
						elif x==x0:
							ch='|'
						draw_ch(x0,y0,flag,"*")
						draw_ch(x,y,flag,"*")#u"\u2588")


signal.signal(signal.SIGINT, quit)
signal.signal(signal.SIGTERM, quit)
flag=int(sys.argv[1])
k_evt = Shell("evtest /dev/input/event1")
k_evt.run_background()
k_evt.det_key(flag) 
