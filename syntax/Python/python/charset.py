line = open("test.txt", "r").readline()
print(line)

print("|".join(dir(str)))
print(line.encode("gbk"))
print(line.encode("utf-8").decode("utf-8"))
