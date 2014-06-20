# encoding: UTF-8

require 'nokogiri'
require 'open-uri'

def fix_invalid_html(html)
  Nokogiri::HTML::DocumentFragment.parse(html).to_html
end

re = /href="(http:\/\/pse-d\.ysx8\.net[^"]+)"/

home_dir = "/opt/var/tmp/liaozhai"

Dir.mkdir(home_dir) unless Dir.exists?(home_dir)
Dir.chdir(home_dir)

ts = []
(1..128).each do |i|
  #ts << Thread.start{    
    uri = "http://www.5tps.com/down/3117_47_1_#{"%03d" %i}.html"
    filename = "%03d.mp3" %i
    unless File.exists?(filename)
      s = open(uri).read
      if s =~ re
        link = $1
      end
      `wget #{link} --output-document=#{filename}`
    else
      puts "#{filename} have already downloaded!"
    end    
  #}
  #if i % 5 == 0
  #  ts.each{ |t| t.join }
  #  ts.clear
  #end
end

ts.each{|t| t.join}