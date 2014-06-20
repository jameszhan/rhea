size = 0

def permutation(l, m, check):
    global size
    k, a, n = 0, [-1 for i in range(m)], len(l)
    while(k >= 0):
        a[k] += 1       
        while(a[k] < n and not check(a, k, m)):
            a[k] += 1
        if(a[k] >= n or k >= m):
            k -= 1
        else:
            if(k == m - 1):
                size += 1
                print([l[a[i]] for i in range(m)])
            else:             
                k += 1
                a[k] = -1
               

def check(a, k, m):
    for i in range(k):        
        if(a[i] == a[k]):
            return False
    return True

permutation(['A', 'B', 'C', 'D', 'E'], 2, check)
print(size)

        
