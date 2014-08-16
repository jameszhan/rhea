~~~clojure

(def
  ^{:arglists '([x seq])
    :doc "Returns a new seq where x is the first element and seq is the rest."
    :added "1.0"
    :static true}
  cons (fn* ^:static cons [x seq] (. clojure.lang.RT (cons x seq))))

;during bootstrap we don't have destructuring let, loop or fn, will redefine later
(def
  ^{:macro true
    :added "1.0"}
  let (fn* let [&form &env & decl] (cons 'let* decl)))

(def
  ^{:macro true
    :added "1.0"}
  loop (fn* loop [&form &env & decl] (cons 'loop* decl)))

(def
  ^{:macro true
    :added "1.0"}
  fn (fn* fn [&form &env & decl]
       (.withMeta ^clojure.lang.IObj (cons 'fn* decl)
         (.meta ^clojure.lang.IMeta &form))))

~~~

~~~java
public final class user$cons extends clojure/lang/AFunction  {

  // access flags 0x9
  public static <clinit>()V
   L0
    LINENUMBER 35 L0
    RETURN
    MAXSTACK = 0
    MAXLOCALS = 0

  // access flags 0x1
  public <init>()V
   L0
    LINENUMBER 35 L0
   L1
    ALOAD 0
    INVOKESPECIAL clojure/lang/AFunction.<init> ()V
   L2
    RETURN
    MAXSTACK = 0
    MAXLOCALS = 0

  // access flags 0x1
  public invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
   L0
    LINENUMBER 35 L0
   L1
    LINENUMBER 35 L1
    ALOAD 1
    ACONST_NULL
    ASTORE 1
    ALOAD 2
    ACONST_NULL
    ASTORE 2
    INVOKESTATIC clojure/lang/RT.cons (Ljava/lang/Object;Ljava/lang/Object;)Lclojure/lang/ISeq;
   L2
    LOCALVARIABLE this Ljava/lang/Object; L0 L2 0
    LOCALVARIABLE x Ljava/lang/Object; L0 L2 1
    LOCALVARIABLE seq Ljava/lang/Object; L0 L2 2
    ARETURN
    MAXSTACK = 0
    MAXLOCALS = 0
}

public final class user$let extends clojure/lang/RestFn  {

  // access flags 0x19
  public final static Lclojure/lang/Var; const__0

  // access flags 0x19
  public final static Lclojure/lang/AFn; const__1

  // access flags 0x9
  public static <clinit>()V
   L0
    LINENUMBER 51 L0
    LDC "user"
    LDC "cons"
    INVOKESTATIC clojure/lang/RT.var (Ljava/lang/String;Ljava/lang/String;)Lclojure/lang/Var;
    CHECKCAST clojure/lang/Var
    PUTSTATIC user$let.const__0 : Lclojure/lang/Var;
    ACONST_NULL
    LDC "let*"
    INVOKESTATIC clojure/lang/Symbol.intern (Ljava/lang/String;Ljava/lang/String;)Lclojure/lang/Symbol;
    CHECKCAST clojure/lang/AFn
    PUTSTATIC user$let.const__1 : Lclojure/lang/AFn;
    RETURN
    MAXSTACK = 0
    MAXLOCALS = 0

  // access flags 0x1
  public <init>()V
   L0
    LINENUMBER 51 L0
   L1
    ALOAD 0
    INVOKESPECIAL clojure/lang/RestFn.<init> ()V
   L2
    RETURN
    MAXSTACK = 0
    MAXLOCALS = 0

  // access flags 0x1
  public doInvoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
   L0
    LINENUMBER 51 L0
   L1
    LINENUMBER 51 L1
    GETSTATIC user$let.const__0 : Lclojure/lang/Var;
    INVOKEVIRTUAL clojure/lang/Var.getRawRoot ()Ljava/lang/Object;
    CHECKCAST clojure/lang/IFn
    GETSTATIC user$let.const__1 : Lclojure/lang/AFn;
    ALOAD 3
    ACONST_NULL
    ASTORE 3
    INVOKEINTERFACE clojure/lang/IFn.invoke (Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
   L2
    LOCALVARIABLE this Ljava/lang/Object; L0 L2 0
    LOCALVARIABLE _AMPERSAND_form Ljava/lang/Object; L0 L2 1
    LOCALVARIABLE _AMPERSAND_env Ljava/lang/Object; L0 L2 2
    LOCALVARIABLE decl Ljava/lang/Object; L0 L2 3
    ARETURN
    MAXSTACK = 0
    MAXLOCALS = 0

  // access flags 0x1
  public getRequiredArity()I
    ICONST_2
    IRETURN
    MAXSTACK = 0
    MAXLOCALS = 0
}
~~~