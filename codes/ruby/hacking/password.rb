

#h = {"vip.qq.com.cn" => 5, "vip.qq.cn" => 6, "test.qq.com" => 3, "qq.com" => 7, "qq.cn" => 8, "163.net" => 8}
h = {a: 1, b:2, c:3}

#h.reduce(Hash.new(0)){|s, n| s.store(:a, s[:a] + n[1]); p s }
p h.reduce(Hash.new(0)){|s, n| s.tap{|ht| ht[:a] += n[1]} }



email = {"vip.qq.com.cn" => 5, "vip.qq.cn" => 6, "test.qq.com" => 3, "qq.com" => 7, "qq.cn" => 8, "163.net" => 8}
r = Hash.new(0)
r["qq.com"] = 0
email.reduce(r)do|h, e|
  m = e[0].scan(/([^.]+)(?:.com.cn|.com|.cn)$/)
  if m[0]
    m[0].tap{|g| h[g[0] + ".com"] += e[1] if g}
    #key = m[0][0] + ".com"
    #h.tap{|ht| ht[key] += e[1]}
    #h.store(key, h[key] + e[1])
    #h[m[0][0] + ".com"] += e[1]
  else
    h[e[0]] += e[1];
  end
  h
end



p r
#.sort.each{|k, v| puts "#{k}    \t#{v}  \t #{(v * 1.0/ total) * 100}%"}