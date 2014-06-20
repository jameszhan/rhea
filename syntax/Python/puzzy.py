
fid = open("log.txt", 'a')

def printr(items):
    for el in items:
        print(el, fid)

a = [1, 2, 3, 4, 5, 7]
b = filter(lambda v : v % 2 == 0, a)
printr(b)
