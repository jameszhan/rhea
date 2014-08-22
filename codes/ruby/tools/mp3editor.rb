require "mp3info"

Dir.chdir("/Users/James/Staged/tmp")
Dir.glob("**/*.mp3") do |f|
	begin
		Mp3Info.open(f) do |mp3|
		  mp3.tag.year = 3338
		  mp3.tag.title = "#{f.split("#")[1]}.mp3"
			#mp3.tag.title = f.gsub("\.mp3", "")
			#mp3.tag.artist = "JAMESFLAG"
			#puts mp3.tag.title
		end
	rescue Exception => e
		puts e
	end
end