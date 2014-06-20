import os
from rhea.codes.python import re


def each(items, predicate, func):
    for item in items:
        p = predicate(item)
        if(p):
            func(item, p)
            
def match(pa, items, func):
    each(items, lambda item: pa.match(item), func)

#def match(pa, s, func):
 #   m = pa.match(s, re.IGNORECASE)
  #  if m:
   #     func(s, m)




#def accept(pa, filenames, func):
 #   for filename in filenames:
  #      m = pa.match(filename)
   #     if m :         
    #        func(filename, m)
    

filenames = os.listdir(os.curdir);
print('当前的文件夹是：', os.curdir);
regex = input("请输入你需要匹配文件的规则（正则表达式）:");
pa = re.compile(regex, re.IGNORECASE);
print('找到如下文件：')
match(pa, filenames, lambda f, m: print(f))
newName = input("输入你的修改策略，m表示你匹配到的结果:")
if(input("确定修改！") ==  'y'):
    match(pa, filenames, lambda f, m: os.rename(f, eval(newName)))

    
#accept(pa, filenames, lambda f, m: print(f))

#accept(pa, filenames, lambda f, m: os.rename(f, m.group(1) + '.txt'))
#for filename in filenames:
    #if pa.match(filename):
        #print(filename);
