#!/usr/bin/python
#python tkinter image

from tkinter import *

def main():
    filename = 'image.jpg'
    root = Tk()
    img = PhotoImage(file=filename)
    label = Label(root, image=img)
    label.pack()
    root.mainloop()

main()
