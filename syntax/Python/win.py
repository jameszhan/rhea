from tkinter import *    
root = Tk(className="interface") #className!!    
w = Label(root) #w = Label(root,text="be your self")    
w["text"] = "be your self"   
w.pack()    
v = Button(root)    
v["text"] = "fire"   
v.pack()    
root.mainloop()   
