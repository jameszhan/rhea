#variable parameter
def total(initial=5, *numbers, **keywords):
    count = initial
    for number in numbers:
        count += number
    for key in keywords:
        count += keywords[key]
    return count

print(total(10, 1, 2, 3, vegetables=50, fruits=100))
print(total(10))
print(total(13, 1, 2, 5))
print(total(1, b=2, c=5))

#format
print('{0}, {1}!'.format('Hello', 'World'))



