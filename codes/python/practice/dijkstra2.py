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

def edge(u, v, mat):
    return mat[u][v]

def heap(v, mat):
    return min((mat[v][i], i) for i in range(len(mat[v])))


#def mark(v, )


def dijkstra(mat):
    o = [N for i in range(6)]
    
    print(heap(0, mat))
    

print(dijkstra(m))
    

        
