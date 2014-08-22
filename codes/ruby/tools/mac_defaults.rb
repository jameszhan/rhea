
["com.apple.Safari", "com.apple.finder"].each do |domain| 
  print domain, "="; `defaults read #{domain}`.lines{|line|puts line}
end