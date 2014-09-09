import sys
N = 4

def place(l, n):
    i = 0
    while(i < n):
        if(l[i] == l[n] or abs(l[n] - l[i]) == n - i):
            return False
        i = i + 1;
    return True;


def queen():
    pos = [-1 for i in range(N)]
    k = 0
    while(k >= 0):
        pos[k] = pos[k]+ 1;
        #while(pos[k] < N and (not place(pos, k))):
        while(not place(pos, k)):
            pos[k] = pos[k] + 1       
        if(pos[k] >= N):
            k = k - 1 #回溯
        else:
            if(k == N - 1):
                print(pos)
            else:
                k = k + 1
                pos[k] = -1
        
    

queen()

