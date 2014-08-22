# encoding: UTF-8

require 'nokogiri'
require 'open-uri'


home_dir = "/opt/var/tmp/明史奇侠"

Dir.mkdir(home_dir) unless Dir.exists?(home_dir)
Dir.chdir(home_dir)

ts = []
(1..100).each do |i|
  ts << Thread.start{
    uri = "http://www.5ips.net/down_201_#{"%03d" %i}.htm"
    puts uri
    doc = Nokogiri::HTML(open(uri))
    link = doc.css(".right li>a")[0].attr(:href)
    filename = "%03d.mp3" %i
    unless File.exists?(filename)
      `wget #{link} --output-document=#{filename}`
    else
      puts "#{filename} have already downloaded!"
    end    
  }
  if i % 5 == 0
    ts.each{ |t| t.join }
    ts.clear
  end
end

ts.each{|t| t.join}