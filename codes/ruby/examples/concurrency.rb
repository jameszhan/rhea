

sum = 0
mutex = Mutex.new
threads = (1..10).map do
  Thread.new do
    1_000_000.times do
      mutex.lock
      sum = sum + 1
      sum = sum + 1
      sum = sum + 1
      mutex.unlock
    end
  end
end

threads.each(&:join)
p sum

threads = (1..10).map do
  Thread.new do
    1_000_000.times do
      mutex.synchronize do
        sum += 1
        sum += 1
        sum += 1
      end
    end
  end
end

threads.each{|t| t.join}
p sum
