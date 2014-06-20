dir1 = "/repo/cellar/ebooks/published/shadow"
dir2 = "/u/cloud/ebooks"

i = 0
Dir.glob("#{dir1}/*.pdf")do|file|
  basename = File.basename(file)
  i += 1
  puts basename unless File.exists?("#{dir2}/#{basename}")
end

puts i


