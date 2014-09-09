
"""
def permutation(l, n, m):
    print(l, n, m)
    if(m >= n):
        print(l)
    else:
        for i in range(m + 1, n):
            l[i], l[m] = l[m], l[i]
            permutation(l, n, m + 1)
            l[i], l[m] = l[m], l[i]
"""

def permutation(l, n, m, k):
    print(l, n, m, k)
    if(k >= m):
        print(l)
    else:
        for i in range(k + 1, m):
            l[i], l[k] = l[k], l[i]
            permutation(l, n, m, k + 1)
            l[i], l[k] = l[k], l[i]
        
    

permutation([1, 2, 3], 3, 1, 0)
