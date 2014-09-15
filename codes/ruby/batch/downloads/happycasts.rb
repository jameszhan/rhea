# encoding: UTF-8

require 'nokogiri'
require 'open-uri'

home_dir = "/opt/var/tmp/happycasts"

Dir.mkdir(home_dir) unless Dir.exists?(home_dir)
Dir.chdir(home_dir)
ts, i = [], 0
(1..3).each do |page|
  url = "http://happycasts.net/episodes?page=#{page}"
  doc = Nokogiri::HTML(open(url))
  doc.css(".episode .episode_watch_btn > a").each do |a|
    i += 1
    href = "http://happycasts.net#{a[:href]}"
    ts << Thread.start(href) do |link|
      begin
        document = Nokogiri::HTML(open(link))
        uri = document.at("#episode>.alternatives>ul>li:last a.btn")[:href]
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

