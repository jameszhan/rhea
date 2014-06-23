# -*- coding: utf8 -*-
__author__ = 'james'

class Duck(object):
    def quark(self):
        print('Quaaaaaark!')

class Person(object):
    def quark(self):
        print('Hello!')

def quarking(duck):
    try:
        duck.quark()
    except AttributeError:
        pass

if __name__ == '__main__':
    duck = Duck()
    person = Person()

    quarking(duck)
    quarking(person)