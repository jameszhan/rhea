# encoding: UTF-8

require 'nokogiri'
require 'open-uri'

Dir.chdir("/opt/var/openclass/Stanford.Programming.Methodology")
url = "http://v.163.com/special/sp/programming.html"
doc = Nokogiri::HTML(open(url))
doc.encoding = "utf-8"


ts = []
doc.css("#list2 td.u-ctitle").each_with_index do |td, i|     
  filename = "#{"%02d" %(i + 1)}.#{td.at('a').text.gsub(/\s/, '')}.mp4"
  next if File.exists?(filename)
  ts << Thread.start {
    begin
      uri = td.at("+td.u-cdown > a")["href"]
      #`wget #{uri} --output-document=#{filename}`
      puts "#{filename} => #{uri} done!\n"
    rescue => e
      puts e
    end
  }
  if (i + 1) % 10 == 0
    ts.each{|t| t.join}
    ts.clear
  end
end


ts.each{|t| t.join}