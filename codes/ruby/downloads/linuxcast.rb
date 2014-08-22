# encoding: UTF-8

require 'nokogiri'
require 'open-uri'

home_dir = "/opt/var/tmp/linuxcast"

Dir.mkdir(home_dir) unless Dir.exists?(home_dir)
Dir.chdir(home_dir)
ts, i = [], 0
(1..3).each do |page|
  url = "http://www.linuxcast.net/public/cast?page=#{page}"
  doc = Nokogiri::HTML(open(url))
  doc.css(".cast_pre > .cast_pre_img > a").each do |a|
    i += 1
    href = "http://www.linuxcast.net/#{a[:href]}"
    ts << Thread.start(href) do |link|
      begin
        document = Nokogiri::HTML(open(link, 'user-agent' => 'Mozilla/5.0', 'accept'=>'text/html'))
        uri = document.at("video#myvideo > source:first")[:src]
        filename = File.basename(uri)
        unless File.exists?(filename)
          `wget #{uri} --output-document=#{filename}`
        else
          puts "#{filename} have already downloaded!"
        end
      rescue => e
        puts "Error => #{e} for open link => #{link}"
        puts e.backtrace 
      end  
      sleep 1 #handle 502 bad gateway.     
    end
    if (i + 1) % 3 == 0
      ts.each{|t| t.join}
      ts.clear
    end
  end  
end
ts.each{|t| t.join }

