def formatNum(num):
    p = re.compile('(?<=\d)(?=(\d{3})+$)')
    return p.sub(',', str(num))


print(formatNum(1234567890))
print(formatNum(123456789))
print(formatNum(12345678))
print(formatNum(1234567))
print(formatNum(123456))
print(formatNum(12345))
print(formatNum(1234))
print(formatNum(123))
print(formatNum(12))
print(formatNum(1))
