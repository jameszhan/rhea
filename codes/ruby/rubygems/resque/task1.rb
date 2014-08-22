
class Task1

	@queue = :task1_queue 
	
	def self.perform()
		i = 0
		begin 	
			i += 1
			puts "Hello This Task1 times #{i} @ #{self}"
		end while(i < 100000)
	end
	
end
