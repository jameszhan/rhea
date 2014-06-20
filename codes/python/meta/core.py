# -*- coding: utf8 -*-
__author__ = 'james'

class base(object):
    v = 1
    def __init__(self):
          pass
          

b = base()
print b.__dict__
b.x = 2
print b.__dict__




