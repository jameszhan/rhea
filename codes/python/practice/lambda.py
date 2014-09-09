
def display(func, x):
    func(x)


expr = input("输入Lambda表达式：")
exec(input("输入一整数先："))
display(eval(expr), x)
