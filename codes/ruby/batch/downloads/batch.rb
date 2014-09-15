# encoding: UTF-8

require 'nokogiri'
require 'open-uri'

tasks = [
  ["http://www.5ips.net/down_578_%02d.htm", "明亡清兴六十年_阎崇年", 46], 
  ["http://www.5ips.net/down_186_%03d.htm", "洪武大帝", 172],
  ["http://www.5ips.net/down_93_%03d.htm", "朱元璋演义_刘兰芳", 185],
  ["http://www.5ips.net/down_92_%03d.htm", "赵匡胤演义", 100],
  ["http://www.5ips.net/down_83_%03d.htm", "红楼梦", 108],
  ["http://www.5ips.net/down_92_%02d.htm", "明末遗恨", 65],
  ["http://www.5ips.net/down_17_%03d.htm", "大明演义", 312],
  ["http://www.5ips.net/down_30_%03d.htm", "明英烈", 162],
  ["http://www.5ips.net/down_191_%03d.htm", "大明英烈", 111],
  ["http://www.5ips.net/down_171_%03d.htm", "洪武剑侠图", 100],
  ["http://www.5ips.net/down_131_%03d.htm", "薛家将", 180],
  ["http://www.5ips.net/down_872_%03d.htm", "薛丁山征西", 100],
  ["http://www.5ips.net/down_116_%03d.htm", "薛刚反唐", 100]
]


q = []; count = 1; ts = []

def download(link, i, dir)  
  begin
    uri = link %i
    doc = Nokogiri::HTML(open(uri))
    link = doc.css(".right li>a")[0].attr(:href)
    filename = "%03d.mp3" %i
    unless File.exists?(filename)
      #puts "download #{link} --output-document=#{dir}/#{filename}"
      `wget #{link} --directory-prefix=#{dir} --output-document=#{dir}/#{filename}`
    else
      puts "#{filename} have already downloaded!"
    end  
  rescue Exception => e
    puts "error: #{link}, #{i}, #{dir}"  
  end
end

tasks.each do|link, name, total|
  home_dir = "/opt/var/tmp/#{name}"
  Dir.mkdir(home_dir) unless Dir.exists?(home_dir)
  (1..total).each do |i|    
    q << [link, i, home_dir]
  end
end


q.each do|link, i, dir|
  count += 1
  ts << Thread.start(link, i, dir){|link, i, dir|
    download(link, i, dir)
  }
  if count % 5 == 0
    ts.each{ |t| t.join }
    ts.clear
  end
end

