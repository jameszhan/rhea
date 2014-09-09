
def display(a):
    l = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K']
    print([l[a[i]] for i in range(len(a))])

    
def backtracking1(n, m, check, handle):
    def dfs(a, k):      
        for i in range(n):
            a[k] = i
            if(check(a, k)):
                if(k == m - 1):
                    handle(a)
                else:
                    dfs(a, k + 1)
    a = [0 for i in range(m)]
    dfs(a, 0)

def backtracking(n, m, check, handle):
    k, a = 0, [-1 for i in range(m)]
    while(k >= 0):
        a[k] += 1
        while(a[k] < n and not check(a, k)):
            a[k] += 1
        if(a[k] == n or k == m):
            k -= 1
        else:
            if(k == m - 1):
                handle(a)
            else:
                k += 1
                a[k] = -1

def counter(n, m):
    backtracking(n, m, lambda a, k : True,\
                 lambda a : print(a))

#counter(10, 3)

def permutation(n, m):
    def check(a, k):
        for i in range(k):
            if(a[i] == a[k]):
                return False
        return True
    backtracking(n, m, check, display)



#permutation(4, 4)

def combination(n, m):
    def check(a, k):
        for i in range(k):
            if(a[i] >= a[k]):
                return False
        return True
    backtracking(n, m, check, display)

#combination(6, 3)
    
def nqueen(n):
    def check(a, k):
        for i in range(k):
            if(a[i] == a[k] or abs(a[i] - a[k]) == k - i):
                return False
        return True
    backtracking(n, n, check, lambda a : print(a))


#nqueen(4)



def deepFirstSearch(g):
    def dfs(n, check, handle):
        k, a = 0, [-1 for i in range(n)]
        while(k >= 0):
            a[k] += 1
            while(a[k] < n and not check(a, k)):
                a[k] += 1
            if(a[k] == n):                
                k -= 1
            else:
                if(k == n - 1):
                    handle(a)
                else:
                    k += 1
                    a[k] = -1
    def check(a, k):
        if(k == 0):
            return True
        for i in range(k):
            if(a[i] == a[k]):
                return False
        for i in range(k-1, -1, -1):            
            if(g[a[i]][a[k]] == 1):
                print(i, k)
                return True           
        return False    
    n = len(g)
    dfs(n, check, display)
"""
mat = [
    [0, 1, 1, 0, 0],
    [1, 0, 0, 1, 1],
    [1, 0, 0, 0, 1],
    [0, 1, 0, 0, 1],
    [0, 1, 1, 1, 0]
]
"""
mat = [
    [0, 1, 1, 1, 0],
    [1, 0, 0, 0, 1],
    [1, 0, 0, 0, 0],
    [1, 0, 0, 0, 0],
    [0, 1, 0, 0, 0]
]
deepFirstSearch(mat)







    
