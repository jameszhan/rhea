def try
  if block_given?
    yield
  end
end

try{
  open(__FILE__).each{|line|
    puts line
  }
}

catch(:done){
  lambda{|i|
    puts i
    throw :done if i <= 0
  }.call(0)
}


p "`date` = '#{`date`}' $? = '#{$?}'"
def get_binding(param)
  return binding
end
b = get_binding('hello')
p eval('param', b)