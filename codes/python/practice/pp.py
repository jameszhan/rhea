import sys
N = 8
size = 0
label = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H']

def ok(l, k):
    i = 0
    while(i < k):
        if(l[i] == l[k]):
            return False
        i = i + 1
    return True
    
def permutation():
    pos = [-1 for i in range(N)]
    k = 0
    while(k >= 0):
        pos[k] = pos[k]+ 1;
        while(not ok(pos, k)):
            pos[k] = pos[k] + 1
        if(pos[k] == N):
            k = k - 1 #回溯
        else:
            if(k == N - 1):
                size = size + 1
                for p in pos:                    
                   sys.stdout.write(label[p] + ",")
                print()
                x = 5
            else:
                k = k + 1
                pos[k] = -1
        #for p in pos:                    
      #      sys.stdout.write(str(p) + ",")
       # print()   
    

permutation()
print(size)

