import os

filenames = os.listdir(os.curdir);
print('当前的文件夹是：', os.curdir);
regex = input("请输入你需要匹配文件的规则（正则表达式）:");
pa = re.compile(regex);
for filename in filenames:
    if pa.match(filename):
        print(filename);
