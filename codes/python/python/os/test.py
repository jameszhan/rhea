import os, sys
from stat import *

def fileinfo(path):
    mode = os.stat(path)[ST_MODE]
    t = 'u'
    if S_ISDIR(mode):
        t = 'd'
    elif S_ISREG(mode):            
        t = 'f'
    return (t, os.path.getsize(path))


os.chdir('e:/')
for f in os.listdir(os.getcwd()):
    try:
        print(fileinfo(f))
    except WindowsError as err:
       print(err)        

    
