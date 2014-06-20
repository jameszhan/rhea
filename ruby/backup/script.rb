

print("Hello, Ruby.\n");
print('Hello, Ruby.\n');

print "Hello, \"Ruby\".\n";
print 'Hello, \ Ruby.', "Another message.\n";

puts "Hello, Ruby.\n", "message form puts."
puts 'Hello, Ruby.\n', "message from puts"

p "Hello, Ruby.\n", "message from p"
p 'Hello, Ruby.\n', "message from p"

#pp "Hello, Ruby.\n"
#pp 'Hello, Ruby.\n', "message from pp"


(1..5).each{|i| print i, ","}

p ""

10.times{|i|
  10.times{|j| print "#{i} * #{j} = #{i*j}\n"}
}

puts "Hello, this is Ruby World."[3..8]

puts %Q|We can write
  anything
  "Just like 'Hello World.'"
  "See it." \n
  in this block.
|

puts %q|We can write
  anything
  "Just like 'Hello World.'"
  "See it."\n
  in this block.
|

p /^(\w+)@(\w+)/ =~ "zhiqiangzhan@gmail.com"
p $1
p $2

p "http://www.google.com/index.htm".sub(%r|[/:.]|, "-")
p "http://www.google.com/index.htm".gsub(%r|[/:.]|, "-")

str = "abstract"
str.sub!(/a/){|matched| '<' + matched.upcase + '>' }
p str
str.gsub!(/a/i){|matched| '<' + matched.upcase + '>' }
p str

"abstractabstract".scan(/(.)(a)/){|matched| p matched}


p "$0=#{$0}, $1=#{$1}, $_=#{$_}, $/=#{$/}"

lang1 = %w{Java C C++ C# Objective-C VB Pascal D Fortran MATLAB Assembly}
lang2 = %w(PHP Python Perl JavaScript Ruby Lua ActionScript Smalltalk Go)
lang3 = %w|Lisp SQL Ada F# Haskell Scheme Erlang Prolog Scala|
lang4 = %w[D SAS COBOL Logo R Go Scratch NXT-G ABAP Forth APL PL/I ML MOO Alice Q awk]
lang5 = ["Delphi/Object Pascal", "RPG(OS/400)", "C Shell", "VB.NET", "Ladder Logic", "Pike", "REBOL"]

lang = lang1 + lang2 + lang3 + lang4 + lang5

p lang[1..6]
p lang[11, 5]

arr1 = [1, 2, 5, 8, 9]
arr2 = [1, 3, 5, 7, 9]
p arr1 | arr2
p arr1 & arr2
p arr1 - arr2
p arr2 - arr1

arr = []
arr.push 'a'
arr << 'b'
arr << 'c'
p arr, arr.first, arr.last

arr.unshift 'd'
arr.unshift 'e'
arr.unshift 'f'
p arr, arr.first, arr.last

p arr.sort
p arr

p arr.sort!
p arr


arr.shift
arr.shift
p arr, arr.first, arr.last

arr.pop
arr.pop
p arr, arr.first, arr.last

arr.pop
arr.pop


list = [1, 2, 3, 6, 8, 9]
list.each { |e| print e  }
puts ""
list.each_with_index{|e, i| p "#{i} => #{e}"}

p Dir.pwd
#Dir.open("/usr/bin"){|dir| dir.each{|name| p name}}

Dir.glob("*.rb\0*.html"){|file| p file}


require "stringio"

io = StringIO.new("A\nB\nC\n");
io.each{|line| p line}
p io.eof?

open("README") do |io|
  io.each{|line| p line}
#  io.readlines.each {|line| p line}
#  while line = io.gets
#    p line;
#  end
end

p File.read("README");


IO.popen("ls -l").each{|line| p line}
open("|ls -l").each{|line| p line}


require "open-uri"

open("http://www.baidu.com"){|io| puts io.read}

options = {
    "Accetp-Language" => "zh-CN, en;q=0.5"
}

#open("http://www.google.com", options)do |io|
#  open("google.html", "w"){|f| f.write(io.read)}
#end




def copy(from, to)
  open(from)do|input|
    open(to, "w") do|output|
        output.write(input.read);
    end
  end
end

require "fileutils"

#Dir.mkdir("temp");
#Dir.mkdir("backup");

FileUtils.cp("script.rb", "backup/script.rb");
FileUtils.mv("google.html", "temp/google.html");
File.rename("temp/google.html", "temp/google.htm");


require "find"

Find.find("/usr/local/shared/ebooks")do|path|
  if FileTest.directory?(path)
    dir, base = File.split(path)
    [/.+pdf$/, /.+pchm$/].each do |re|
      if re =~ base
        Find.prune;
      end
    end
    puts path
  end
end







