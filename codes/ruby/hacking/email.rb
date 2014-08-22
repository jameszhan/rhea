# encoding: UTF-8

total = 0
email = Hash.new(0)

open("www.csdn.net.sql", "rb:iso8859-1").each_line do |line|
  line.encode!("utf-8")
  groups = line.split(/\s#\s/)
  if groups.length == 3
    total += 1
    groups[2].scan(/@([^$]+)$/)do|m|
      #og = m[0].downcase.strip.gsub("vip.", "").gsub(".com.cn", ".com").gsub(".cn", ".com")
      #email[og] += 1
      p m[0]
      email[m[0][0].strip] += 1
    end
  end
end


p email



=begin
email.reduce(Hash.new(0))do|h, e|
  m = e[0].scan(/([^.]+)(?:.com.cn|.com|.cn)$/)
  h.tap{|ht| h[m[0][0] + ".com"] += e[1] if m[0]}.tap{|ht| h[e[0]] += e[1] unless m[0]}
end.sort.each{|k, v| puts "#{k}    \t#{v}  \t #{(v * 1.0/ total) * 100}%"}

#email.sort{|a, b| a[1] <=> b[1]}.each{|k, v| puts "#{k}    \t#{v}  \t #{(v * 1.0/ total) * 100}%"}

=end

