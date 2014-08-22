# encoding: UTF-8
total = 0
statistics = Hash.new(0)
open("www.csdn.net.sql", "rb:iso8859-1").each_line do |line|
  line.encode!("utf-8")
  groups = line.split(/\s#\s/)
  if groups.length == 3
    total += 1
    groups[2].scan(/@([^$]+)$/) do |m|
      statistics[m[0].chomp] += 1
    end
  end
end

p statistics