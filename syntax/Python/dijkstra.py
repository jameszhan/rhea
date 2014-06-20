import sys
"""
         B
       / |    \
    8    9      29
  /      |         \
A--16----C---15------F
  \                /
   \              /
    7           18
     \          /
      D---10---E


struct [权值, 节点编号]

"""


#m = [[N for j in range(6)] for i in range(6)]
N=65536

m = [
        [ N, 8,  16, 7,  N,  N ],
        [ N, N,  9,  N,  N, 29 ],
        [ N, N,  N,  N,  N, 15 ],
        [ N, N,  N,  N,  10, N ],
        [ N, N,  N,  N,  N, 18 ],
        [ N, N,  N,  N,  N,  N ],
    ]



for i in range(6):
    for j in range(6):     
        sys.stdout.write(str(m[i][j]) + '\t')
    print()

def dijkstra(mat):
    o = []
    c = []  
    for i in range(len(mat[0])):
        if m[0][i] < N:
            o.append((mat[0][i], i))
    c.append((0, 0))
    while len(o) != 0:
        w, id = o.pop(0)        
        for i in range(len(mat[id])):
            if mat[id][i] < N:
                o.append((mat[id][i] + w, i))
        #print(w, id)
        if(max(c)[0] <= w):
            c.append((w, id))
        else:
            #c = []
            c.append((w, id))
        if(id == len(mat[0]) - 1):          
            break
    return c

print(dijkstra(m))
    
    

"""
def dijkstra():
    OPEN = []
    CLOSE = []    
    CLOSE.append((0, 0))
    for i in range(len(m[0])):
        if m[0][i] < N:
            OPEN.append((m[0][i], i))
    
    while True:
        curr, index = min(OPEN)
        CLOSE.append((curr, index))
        for i in range(index, len(m[index])):
            if m[index][i] < N:
                OPEN.append((m[index][i], i))

        break
             
    return CLOSE
print(dijkstra())
"""
        
