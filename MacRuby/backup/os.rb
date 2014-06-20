

print 'os name is ', `uname`
print 'os name is ', %x{uname}
print 'os name is ', Kernel.`("uname")

`echo *.rb`.lines.each {|f| puts f}

pipe = open("| echo *.rb")
files = pipe.readlines
files.each{|f| print f}
pipe.close  

pid = fork
if(pid)
  puts "Hello from parent process: #$$"
  puts "Created child process #{pid}"
else
  puts "Hello from child process: #$$"
end

open("|-", "r+") do |child|
  if child
    #This is the parent process
    files = child.readlines
    child.close
  else 
    #This is the child process
    exec("ls", "-l")
  end
end 

trap("SIGINT"){
  puts "Ignoring SIGINT"
}
