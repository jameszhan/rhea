# -*- coding: utf8 -*-
__author__ = 'james'

def hi(name):
    return "hello %s" % name

class Base(object):
    def __init__(self):
      self.x = 'x'
      self.y = 'y'
      self.z = 'z'
        
    def __getattr__(self, name):
        if name == 'hello':
            l = lambda x: x + 1
            self.__setattr__(name, l)
            return l
        elif name == 'world':
            return hi
        else: 
            raise AttributeError(name)
            pass
        

if __name__ == '__main__': 
    b = Base()
    print(b.x, b.y, b.z)
    print(b.hello(1))
    print(b.world('James'))    
    #print(b.a)
    