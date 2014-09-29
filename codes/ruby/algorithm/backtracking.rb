
module Backtracking
  
  ALPHABET = Array('A'..'Z')
  DISPLAY = lambda {|a| p a.map{|i|ALPHABET[i]}}
  
  
  def backtrace(n, m, handle = DISPLAY)
    k, a = 0, Array.new(m, -1)
    while k >= 0
      a[k] += 1
      while a[k] < n && !yield(a, k)
        a[k] += 1
      end
      if a[k] == n || k == m
        k -= 1
      else
        if k == m - 1
          handle.call(a)
        else
          k += 1
          a[k] = -1
        end
      end
    end
  end
  
  def backtrack(n, m, handle = DISPLAY)
    dfs = lambda{|a, k|
      #for i in (0...n) do
      (0...n).each do |i|
        a[k] = i
        if yield(a, k)
          if k == m - 1
            handle.call(a)
          else
            dfs.call(a, k + 1)
          end
        end
      end
    }
    a = Array.new(m, -1)
    dfs.call(a, 0)
  end

  
  def counter(n, m, &handle)
    handle = DISPLAY unless handle
    backtrace(n, m, handle) do |a, k|
      true
    end
  end
  
  def permutation(n, m, &handle)
    handle = DISPLAY unless handle
    backtrack(n, m, handle) do |a, k|
      succ = true
      for i in (0...k) do 
       if a[i] == a[k]
         succ = false
         break
       end
      end
      succ
    end
  end
  
  def combination(n, m, &handle)
    handle = DISPLAY unless handle
    backtrace(n, m, handle) do |a, k|
      succ = true
      (0...k).each do |i|
        if a[i] >= a[k]
          succ = false
          break
        end
      end
      succ
    end
  end

  def nqueen(n, &handle)
    backtrace(n, n, handle) do |a, k|
      succ = true
      (0...k).each do |i|
        if a[i] == a[k] || (a[i] - a[k]).abs == k - i
          succ = false
          break
        end
      end
      succ
    end
  end
    
  def permutation2(a, n)
    if n == 0
      p a
    else
      n.times do |i|
        a[n - 1], a[i] = a[i], a[n - 1]
        permutation2(a, n - 1)
        a[n - 1], a[i] = a[i], a[n - 1]
      end
    end
  end
  
end

if __FILE__ == $0
  include Backtracking
  begin
    puts 'counter =>'
    counter(3, 3)
  
    puts 'permutation =>'
    permutation(3, 3){|a|p a.map{|i| i + 1}}
  
    puts 'combination =>'
    combination(5, 2){|a|p a.map{|i| i + 1}}
  
    puts 'nqueue => '
    nqueen(4){|a|p a.map{|i| i + 1}}
  
    puts 'permutation2 =>'
    permutation2([1, 2, 3], 3)
  
  rescue Exception => e
    puts e
    puts e.backtrace
  end
end