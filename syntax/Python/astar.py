import sys

"""
0 0 0 0 0 0 0 0 0 
0 0 0 0 1 0 0 0 0
0 0 A 0 1 0 B 0 0
0 0 0 0 1 0 0 0 0
0 0 0 0 0 0 0 0 0
"""

m = [[(i, j, 0) for j in range(9)] for i in range(5)]
for i in range(1, 4):
    m[i][4] = (m[i][4][0], m[i][4][1], 1)
for i in range(5):
    for j in range(9):
        sys.stdout.write(str(m[i][j][2]) + ' ')
    print()



