

def backtracking(n, check, handle):
    k, a = 0, [-1 for i in range(n)]
    while(k >= 0):
        a[k] += 1
        while(a[k] < n and (not check(a, k))):
            a[k] += 1
        if(a[k] == n):
            k -= 1
        else:
            if(k == n - 1):                
                handle(a)
            else:
                k += 1
                a[k] = -1   


def permutation(l):
    def check(a, k):
        for i in range(k):
            if(a[i] == a[k]):
                return False
        return True
    n = len(l)
    backtracking(n, check, lambda a : print([l[a[i]] for i in range(n)]))

#permutation(['A', 'B', 'C'])


def nqueen(n):
    def check(a, k):
        for i in range(k):
            if(a[i] == a[k] or abs(a[i] - a[k]) == k - i):
                return False
        return True
    backtracking(n, check, lambda a : print(a))

#nqueen(4)


def backtracking2(n, m, check, handle):
    k, a = 0, [-1 for i in range(m)]
    while(k >= 0):
        a[k] += 1
        while(a[k] < n and (not check(a, k))):
            a[k] += 1
        if(a[k] == n or k == m):
            k -= 1
        else:
            if(k == m - 1):                
                handle(a)
            else:
                k += 1
                a[k] = -1

def permutation2(l, m):
    def check(a, k):
        for i in range(k):
            if(a[i] == a[k]):
                return False
        return True
    n = len(l)
    backtracking2(n, m, check, lambda a : print([l[a[i]] for i in range(len(a))]))

#permutation2(['A', 'B', 'C', 'D'], 2)

def combination(l, m):
    def check(a, k):
        for i in range(k):
            if(a[i] >= a[k]):
                return False
        return True
    n = len(l)
    backtracking2(n, m, check, lambda a:print([l[a[i]] for i in range(len(a))]))


combination(['A', 'B', 'C', 'D'], 2)
