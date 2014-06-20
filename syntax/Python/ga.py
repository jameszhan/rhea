import random



data = [random.sample(range(60, 99), 6) for e in range(100)]



def ga(data, a, b, func):
    e = [max(a[i], b[i]) for i in range(len(a))];
    func(data, a)
    func(data, b)
    try:
        data.index(e)
    except:
        data.append(e)

def strip(data, a):
    for e in a:
        if(e < 95):
            data.remove(a)
            break;


for i in range(100):
    j = 0
    while j < len(data) - 1:   
        ga(data, data[j], data[j+1], strip)
        j += 2
   
for e in data:
    print(e)

        

"""
print(random.randint(10, 100))
print(random.randrange(10, 100, 3))
print(random.sample(range(10, 100), 3))

a = []
for x in range(100):
    a.append(random.sample(range(10, 100), 5))

for e in a:
    print(e)


data = [(random.randint(10, 99), random.randint(10, 99),\
         random.randint(10, 99), random.randint(10, 99),\
         random.randint(10, 99), random.randint(10, 99))\
         for x in range(100) ]

"""
