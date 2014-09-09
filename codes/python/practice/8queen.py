
LEN = 4


def ok(s, i, j):
    for (x, y) in s:
        if(x == i or y == j or i - x == j - y or i - x == y - j):
            return False
    return True



s = []
k = 0
i = 0
while i < LEN:
    flag = False
    for j in range(LEN):
        if(ok(s, i, j)):
            flag = True
            s.append((i, j))
    if(not flag):
        i = 0
        k = k + 1
        j = k
        print(i, k)
        s = []
           

   
    
#return s

print(s)

