require 'resque'
require './task1'
require './task2'

begin 
	Resque.enqueue(Task1) 
	Resque.enqueue(Task2) 
rescue Exception => e
	puts e
end