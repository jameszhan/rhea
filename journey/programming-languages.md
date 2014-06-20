代码知多少——编程语言漫谈


1. 弱类型 vs 强类型
2. 动态语言 vs 静态语言

### C++ template 生成代码
静态展开

### 宏编程
Read Macro


### 编程语言做什么事情
1. 内存管理
2. 文本协议（XML, JSON，Regex）
3. IO （文件系统，网络）


### How to Write the Compiler
Lexer | Parser


~~~java
public class Token {
    public final int type;
    public final String text;
    public Token(int type, String text){
        this.type = type;
        this.text = text;
    }
    public String toString(){
        return "<'" + text + "', " + tokenNames[type] + ">";
    }
}

public class AST {
    public final Token token;
    public final List<AST> children = new ArrayList<AST>();
    public AST(Token token) {
        this.token = token;
    }
    public void addChild(AST t) {
        children.add(t);
    }
    public int getNodeType(){
        return token.type;
    }
    public boolean isNil() {
        return token == null;
    }
}

public class Symbol {
    public final String name;
    public final Type type;
    public Symbol(String name, Type type) {
        this.name = name;
        this.type = type;
    }
}

public interface Scope {
    String getScopeName();
    Scope getEnclosingScope();
    void define(Symbol sym);
    Symbol resolve(String name);
}


void cpu() {
    short bytecode = codes[ip];
    while (<<bytecode-not-halt>> && ip < codes.length) {
        ip++; //指令计数器自增，跳到下一条指令或操作数
        switch(bytecode) {
            case <<bytecode1>>: <<execute bytecode1>>; break;
            case <<bytecode2>>: <<execute bytecode2>>; break;
            case BR:
                int addr = <<将code[ip]处的四个字节转换为整型数>>；
                ip = addr
                break;
            case ICONST:
                int word = <<将code[ip]处的四个字节转换为整型数>>；
                ip += 4; //跳过操作数的四个字节
                <<将word中的数压入栈中>>;
                break;
            ...
            case <<bytecodeN>>: <<execute bytecodeN>>; break;
        }
        bytecode = codes[ip];
    }
}


(defmacro defrecord

  {:added "1.2"
   :arglists '([name [& fields] & opts+specs])}

  [name fields & opts+specs]
  (validate-fields fields)
  (let [gname name
        [interfaces methods opts] (parse-opts+specs opts+specs)
        ns-part (namespace-munge *ns*)
        classname (symbol (str ns-part "." gname))
        hinted-fields fields
        fields (vec (map #(with-meta % nil) fields))]
    `(let []
       (declare ~(symbol (str  '-> gname)))
       (declare ~(symbol (str 'map-> gname)))
       ~(emit-defrecord name gname (vec hinted-fields) (vec interfaces) methods)
       (import ~classname)
       ~(build-positional-factory gname classname fields)
       (defn ~(symbol (str 'map-> gname))
         ~(str "Factory function for class " classname ", taking a map of keywords to field values.")
         ([m#] (~(symbol (str classname "/create")) m#)))
       ~classname)))

~~~



* 鸭子类型(Duck Type)，Protocol 或 Interface
Go语言中，只要有Interface中定义的方法，就算实现了该接口，赞！
Swift尽管依然需要声明Class实现某Protocol，看起来也挺别扭的，但是swift中有extension，可以在类型定义后，再声明class实现protocol，虽然繁琐点，但依然不是灵活性。

* method_missing
ruby method_missing
python

* Mixin
~~~ruby
module Foo
    def foo
        "foo"
    end
end
module Bar
    def bar
        "bar"
    end
end
class Demo
    include Foo, Bar
end
~~~



* Open Class

~~~ruby
class Numeric
    def square
        self * self
    end
end
3.square
~~~

~~~swift
extension Int {
    func square(){
        self * self
    }
}
3.square()
~~~

~~~c#
namespace ExtensionMethods {
    public static class MyExtensions {
        public static int square(this Int32 value) {
            return value * value;
        }
    }
}
using ExtensionMethods;
3.square
~~~



