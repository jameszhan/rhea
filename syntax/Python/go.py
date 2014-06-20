def each(items, func):
    for item in items:
        func(item)

def output():
    arr = [3, 2, 4, 7, 8]
    def func(item):
        print(item)
    each(arr, func)
    

arr = [1, 2, 3, 4, 5]

each(arr, lambda item: print(item))
output()
func('ad')
