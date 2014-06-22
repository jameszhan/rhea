LISP前世今生
===========

### cons网络
1. Lisp中最重要的数据类型是表(List)。
2. List由被称为单元(Cell)的数据连接起来所构成的，历史上称为cons单元。
3. 一个单元包含两个值，一个是car(Contents of the Address part of Register number)，另一个叫做cdr(Contents of the Decrement part of Register number)。他们的值可以是对其他单元的引用，也可以是原子(Atom)。

### cons网络->S-Expression
S-Expression用以下规则把列表(List)转换为字符串表示形式
1. cons单元中，car的值和cdr的值用点连接，再用括号括起来。
2. cdr如果是列表的话，省略括号。
3. 末尾的cdr如果是nil，那么省略.nil。

### Lisp程序
Lisp程序是由Form(S-Expression)排列起来构成的，它通过下面的规则来进行求值。
1. 符号(Symbol)会被解释为变量，求出该变量所绑定的值。
2. 除符号以外的原子，则求出其自身的值。
3. 如果Form为表(List)，则头一个符号(Symbol)为“函数名”，表中剩余的元素为参数。
在Form中表示函数名的部分，包含函数，宏和特殊形式三种类型。





