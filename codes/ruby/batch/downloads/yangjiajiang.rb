require 'nokogiri'
require 'open-uri'


home_dir = "/opt/var/tmp/yangjiajiang"

Dir.mkdir(home_dir) unless Dir.exists?(home_dir)
Dir.chdir(home_dir)

ts = []
(1..136).each do |i|
  ts << Thread.start{
    uri = "http://www.5ips.net/down_90_#{"%03d" %i}.htm"
    puts uri
    doc = Nokogiri::HTML(open uri)
    doc.encoding = "utf-8"
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