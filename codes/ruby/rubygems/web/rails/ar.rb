%w(rubygems active_record).each { |dep| require dep } 

ARB = ActiveRecord::Base 

ARB.establish_connection(
	:adapter => 'mysql', 
	:username => 'root', 
	:password => '123456',
	:database => 'mysql'
) 
def user_count
	ARB.connection.select_all('select * from user limit 1000')
end 

puts user_count
