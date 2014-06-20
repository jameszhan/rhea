
size = 0

def resolve(l, check):
    global size
    n, k, a = len(l), 0, [-1 for i in range(len(l))]
    while(k >= 0):
        a[k] = a[k] + 1
        while(not check(a, k, n)):
            a[k] = a[k] + 1
        if(a[k] >= n):
            k = k - 1
        else:
            if(k == n-1):
                size = size + 1
                print([l[a[i]] for i in range(n)])
            else:
                k = k + 1
                a[k] = -1    

resolve(['A', 'B', 'C', 'D'], lambda a, k, n: True)
print(size)
size = 0

def check(a, k, n):
    i = 0
    while(i < k):
        if(a[i] == a[k]):
            return False
        i = i + 1
    return True

resolve(['A', 'B', 'C', 'D'], check)

print(size)
    
    
