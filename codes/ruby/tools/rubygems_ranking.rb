require 'rubygems'
require 'nokogiri'
require 'pry'
require 'open-uri'

doc = Nokogiri::HTML(open("https://www.ruby-toolbox.com/categories/by_name"))
arr = doc.css('#content ul.group_items>li').collect(&:text).collect{|i| i.split("\n\n")}
print "source 'http://rubygems.org'\n"

arr.each do |e|
  g = e[1].split(", ").first
  begin
    g = g.split("\n")[-1]
    p g.downcase.split(' ').join('_')
  rescue Excetpion => e
    p e
  end
end