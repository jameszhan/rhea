import time, __builtin__
t1 = time.time()
for i in range(100000000):
    pass
t2 = time.time()
for i in __builtin__.range(100000000):
    pass
t3 = time.time()
print(t2 - t1)
print(t3 - t2)
