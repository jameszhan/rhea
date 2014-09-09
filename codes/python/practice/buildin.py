from functools import reduce

a = [4, 7, 1, 3, 2, 8, 9, 0]
print(a);

print(list(filter(lambda v : v > 5, a)))
print(list(map(lambda x, y : x + y, a, a)))
print(reduce(lambda x, y:x*y, [1, 2, 3]))
print(list(zip(a)))
