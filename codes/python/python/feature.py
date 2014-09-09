def func(*x):
    if(len(x) == 0):
        return None
    else:
        return x


print(func(), func(1), func(1, 2, 3))

def func1(**x):
    if(len(x) == 0):
        return None
    else:
        return x


print(func1(), func1(x=1, y=2), func1(a=1, b=2, c=3))

def log(func):
    def wrapper(*args, **kv):
        print('enter', func.__name__)
        func(*args, **kv)
        print('exit', func.__name__)
    wrapper.__name__ = func.__name__
#    wrapper.__globals__ = func.__globals__
    return wrapper

@log
def test(x, y=1, *a, **b):
    print("test", x, y, a, b)

test(1)
test(1, 2)
test(1, 2, 3)
test(1, 2, 3, 4)
test(1, 2, 3, 4, 5)
test(x=1, y=2)
test(1, a=2)
test(1, 2, 3, a=4)
test(1, 2, 3, u=2)




class Indexable():
    def __getitem__(self, i):
        if i > 10:
            raise StopIteration()
        print('get object %d' %i)


l = Indexable()
for i in l:
    pass

class Iterable(object):
    def __init__(self):
        self.counter = 10
    def __iter__(self):
        return self
    def __next__(self):
        if self.counter <= 0:
            raise StopIteration()
        print('get next, current is %d' %self.counter)
        self.counter -= 1

l = Iterable()
for i in l :
    pass
