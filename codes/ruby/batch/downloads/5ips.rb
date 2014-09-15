require 'nokogiri'
require 'open-uri'


home_dir = "/opt/var/tmp/5ips"

Dir.mkdir(home_dir) unless Dir.exists?(home_dir)
Dir.chdir(home_dir)

ts = []
(1..100).each do |i|
  ts << Thread.start{
    uri = "http://www.5ips.net/down_113_#{"%03d" % i}.htm"
    doc = Nokogiri::HTML(open uri)
    doc.encoding = "utf-8"
    `wget #{doc.css(".right li>a")[0].attr(:href)} --output-document=#{"%03d.mp3" %i}`
  }
  if i % 8 == 0
    ts.each{ |t| t.join }
    ts.clear
  end
end

ts.each{|t| t.join}