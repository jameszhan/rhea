# encoding: UTF-8

puts (5..10).reduce(:+)                            #=> 45
# Same using a block and inject
puts (5..10).inject {|sum, n| sum + n }            #=> 45

puts (5..10).reduce(1, :*)                         #=> 151200
# Same using a block
puts (5..10).inject(1) {|product, n| product * n } #=> 151200



# find the longest word
longest = %w{ cat sheep bear }.inject do |memo,word|
  memo.length > word.length ? memo : word
end
puts longest


#精细duck typing控制
#duck typing的精神就是行为决定类型，而不是相反
a = []
#不用
#if a.kind_of? Array then a << 1
#if a.instance_of? Array then a << 1
#而用
#a << 1 if a.respond_to? :<<; puts a

p (1..3).inject([]){|r, item|r << item};
p (1..3).inject([], :<<);
p (1..3).reduce([], :<<);


p [['a', 1], ['b', 2], ['c', 3], ['a', 6], ['b', 7], ['c', 8], ['a', 9]].reduce(Hash.new(0)){|m, item| 
  m.tap{ m[item[0]] += item[1] }
};
p [[:a, 1], [:b, 2], [:c, 3], [:a, 6], [:b, 7], [:c, 8], [:a, 9]].reduce(Hash.new(0)){|m, item| 
  m.tap{ m[item[0]] += item[1] }
};