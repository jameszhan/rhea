
require 'rbconfig'
include Config

CONFIG.each{|k, v|puts "CONFIG[#{k}]=#{v}"}

require 'cgi'
puts CGI.escape("Nicholas Payton/Trumpet & Flugel Horn")
puts CGI.escape_html("a < 100 && b > 200")
puts CGI.escape_element("<hr /><a href='/mp3'>Click Here</a><br />")
puts CGI.unescape("Nicholas+Payton%2FTrumpet+%26+Flugel+Horn")
puts CGI.unescape_html("a &lt; 100 &amp;&amp; b &gt; 200")
puts CGI.unescape_element("<hr /><a href='/mp3'>Click Here</a><br />")