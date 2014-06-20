
5.times{ print 'OK ' }

sum = 0; (1..5).each{|i| sum += i}; print 'sum=', sum, "\n"

['Apple', 'Banana', 'Pear'].each{|elem| print "#{elem}, "}

scores = {'James'=>100, 'Nancy'=>99, 'Peter'=>62}
scores.each{|k, v| print "key=#{k}, val=#{v}\n"}
scores.each{|pair| sum += pair[1]}; print sum
