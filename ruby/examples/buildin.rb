
Module.new.methods.sort.each{|m|
  p m
}


[Enumerable, Comparable, Errno].each{|mo|
  print mo, "=> ["
  mo.methods.each{|m|
    print m, " " unless Module.method_defined?(m)
  }
  print "]\n"
}

[GC, GC::Profiler, ObjectSpace, Marshal, Signal, Math, Process::GID, Process::Sys, Process, FileTest, Kernel].each{|mo|
  methods = []
  mo.methods.each{|m|
    methods << m unless Module.method_defined?(m)
  }
  print mo, "=> [", methods.join(","), "]\n"
}

p "numeric"
numeric = [Bignum, Fixnum, Integer, Float, Rational, Complex, Numeric]
#numeric.each{|c| puts c.ancestors.join("\t")}

p "collection"
collection = [Array, Hash, Range, Enumerator]
#collection.each{|c| p c.ancestors}

puts "\nbasic types"
types = [Struct::Tms, Struct,  String, Symbol,Time, NilClass,TrueClass, FalseClass, Exception]
#types.each{|c| puts c.ancestors.join("\t")}

puts "\nlanguage"
lang = [Class, Module, Method, UnboundMethod, Proc, Binding, Object, BasicObject]
#lang.each{|c| puts c.ancestors.join("\t")}

puts "\nrunnable"
runnable = [Process::Status, Thread, ThreadGroup, Mutex, Fiber]
#runnable.each{|c| p c.ancestors}


puts "\ntext"
text = [Encoding,  File::Stat, IO, MatchData, Regexp]
#text.each{|c| p c.ancestors}
=begin

  Biguum ->
  Fixnum -> Integer ->
            Float   ->
            Rational->
            Complex ->
                        Numeric   ->
                        NilClass  ->
                        String    ->
                        Array     ->
                        Range     ->
                        Hash      ->

            Class  ->   Module    ->
                        Proc      ->
                        Method    ->
                                        Object -> BasicObject



=end