
class Task2

	@queue = :task2_queue 
	
	def self.perform()
		i = 0
		begin 	
			i += 1
			sleep 10
			puts "Hello This Task2 times #{i} @ #{self}"
		end while(i < 10)
	end
	
end
