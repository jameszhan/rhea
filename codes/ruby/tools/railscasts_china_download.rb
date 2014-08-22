# encoding: UTF-8

require 'nokogiri'
require 'open-uri'

Dir.chdir("/opt/var/openclass/railscasts-china")
ts = []
(1...5).each do |page|
  url = "http://railscasts-china.com/?page=#{page}"
  doc = Nokogiri::HTML(open(url))
  doc.encoding = "utf-8"
  doc.css("article .watch > a").each do |a|
    href = "http://railscasts-china.com/#{a[:href]}"
    ts << Thread.start(href) do |link|
      begin
        document = Nokogiri::HTML(open(link))
        uri = document.at(".watch > a.btn-info")[:href]
        filename = File.basename(uri)
        unless File.exists?(filename)
          puts uri
        else
          puts "#{filename} have already downloaded!"
        end
      rescue => e
        puts "Error => #{e} for open link => #{link}"
        puts e.backtrace
      end
    end    
    sleep 1 #handle 502 bad gateway.
  end  
end
ts.each{|t| t.join }

