import random

def shuffle(l):
    n = len(l)
    for i in range(n):
        #j = random.randint(0, n - i - 1) + i
        j = random.randint(0, n - 1)
        #print(i, j)
        l[i],l[j] = l[j], l[i]


l = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
shuffle(l)

print(l)
