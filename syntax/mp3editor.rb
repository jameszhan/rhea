require "mp3info"

home_dir = "/opt/var/tmp/liaozhai"
Dir.chdir(home_dir)
Dir.glob("**/*.mp3") do |f|
	begin
		Mp3Info.open(f) do |mp3|
		  mp3.tag.year = 3306
		  #mp3.tag.title = "#{f.split("#")[1]}.mp3"
			mp3.tag.title = f.gsub("\.mp3", "")
			mp3.tag.artist = "JAMESFLAG"
			puts mp3.tag.title
		end
	rescue Exception => e
		puts e
	end
end