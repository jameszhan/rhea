module Sorting
  
  def insert_sort(a)
    (1...a.length).each{|i|
      curr, j = a[i], i - 1
      while(j >= 0 && a[j] > curr)
        a[j + 1] = a[j]
        j -= 1
      end
      a[j + 1] = curr
    }            
  end    
  
  def insert_sort1(a)
    (1...a.length).each{|i|
      curr, k = a[i], i - 1
      (0...i).reverse_each{|j|
        if(a[j] > curr)
          k, a[j + 1] = j, a[j]
        else
          k = j + 1
          break
        end
      }
      a[k] = curr
    }            
  end
  
  def insertion_sort(a)
    a.each_with_index do |e, i|
      j = i - 1
      while j >= 0
        break if a[j] <= e
        a[j+1] = a[j] 
        j -= 1
      end    
      a[j + 1] =e
    end
    a
  end
  
  def bin_insert_sort(a)
    search = lambda{|a, l, r, data|
      if(l < r)
        mid = (l + r) / 2
        if(data > a[mid])
          search.call(a, mid + 1, r, data)
        elsif(data < a[mid])
          search.call(a, l, mid, data)
        else
          return mid
        end
      else
        l
      end
    }
    _search = lambda{|a, l, r, data|
      while(l < r)
        mid = (l + r) / 2
        if(data > a[mid])
          l = mid + 1
        elsif(data < a[mid])
          r = mid
        else
          return mid
        end
      end
      return l
    }
    (1...a.length).each{|i|
      curr, j = a[i], i
      index = _search.call(a, 0, i, curr)
      while(j > index)
        a[j] = a[j - 1]
        j -= 1
      end     
      a[index] = curr 
    }
  end  
  
  def select_sort(a)
    (0...a.length).each{|i|
      k = i
      (i + 1...a.length).each{|j|
        if(a[k] > a[j])
          k = j       
        end
      }
      if(k != i)
        a[k], a[i] = a[i], a[k]
      end
    }
  end
  
  def select_sort1(a)
    (0...a.length).reverse_each{|i|
      k = i
      (0...i).each{|j|
        if(a[k] < a[j])
          k = j       
        end
      }
      if(k != i)
        a[k], a[i] = a[i], a[k]
      end
    }
  end
  
  def selection_sort(a)
    a.size.times do |i|
      min = i
      i.upto(a.size - 1) do |j|
        min = j if a[min] > a[j]
      end
      a[i] = a[min]
    end
    a
  end
  
  def bubble_sort(a)
    (0...a.length).each{|i|
      swapped = false
      (i...a.length).reverse_each{|j|
        if(a[j - 1] > a[j])
          a[j - 1], a[j] = a[j], a[j - 1]
          swapped = true
        end
      }
      if(!swapped)
        break
      end
    }
  end
  
  def bubble_sort1(a)
    (0...a.length).each{|i|
      swapped = false
      (0...a.length - i - 1).each{|j|
        if(a[j] > a[j + 1])
          a[j], a[j + 1] = a[j + 1], a[j]
          swapped = true
        end
      }
      if(!swapped)
        break
      end
    }
  end
  
  def bubble_sort2(a)
    cur = 0
    loop{
      swapped = false
      (a.size - 2).downto(cur) do |i|
        if a[i + 1] < a[i]
          a[i + 1], a[i] = a[i], a[i + 1] 
          swapped = true
        end
      end
      break unless swapped
    }
    a
  end
  
  def quick_sort(a)
    pivot = lambda{|a, min, max|
      t, l, r = a[min], min, max - 1
      while(l < r)
        while(l < r && a[r] > t)
          r -= 1
        end
        if(l < r)
          a[l] = a[r]
          l += 1
        end
        while(l < r && a[l] < t)
          l += 1
        end
        if(l < r)
          a[r] = a[l]
          r -= 1
        end
      end 
      a[l] = t
      l     
    }        
    _sort = lambda{|a, l, r|
      return if l >= r
      mid = pivot.call(a, l, r)
      _sort.call(a, l, mid)
      _sort.call(a, mid + 1, r)      
    }
    _sort.call(a, 0, a.length)
  end
  
  def merge_sort(a)
    merge = lambda{|a, l, m, r|
      i, j, t, k = l, m + 1, [], 0
      while(i <= m && j <= r)
        if(a[i] > a[j])
          t[k] = a[j]
          k, j = k + 1, j + 1 
        else
          t[k] = a[i]
          k, i = k + 1, i + 1
        end
      end
      if(i > m)
        while(j <= r)
          t[k] = a[j]
          k, j = k + 1, j + 1
        end
      else
        while(i <= m)
          t[k] = a[i]
          k, i = k + 1, i + 1
        end
      end
      i, k = l, 0
      while(i <= r)
        a[i] = t[k]
        k, i = k + 1, i + 1
      end
    }
    sort = lambda{|a, l, r|
      if(l < r)
        m = (l + r) / 2
        sort.call(a, l, m)
        sort.call(a, m + 1, r)
        merge.call(a, l, m, r)
      end      
    }
    sort.call(a, 0, a.length - 1)
  end
  
  def merge_sort1(a)
    merge = lambda{|src, dst, k|
      s1, s2, m, n = 0, k, 0, src.length
      while(s1 + k < n)
        e1, e2 = s2, (s2 + k < n) ? s2 + k : n
        i, j = s1, s2             
        while(i < e1 && j < e2)          
          if(src[i] <= src[j])
            dst[m] = src[i]
            i += 1
          else
            dst[m] = src[j]
            j += 1
          end
          m += 1
        end
        while(i < e1)
          dst[m] = src[i]
          m, i = m + 1, i + 1
        end
        while(j < e2)
          dst[m] = src[j]
          m, j = m + 1, j + 1
        end
        s1 = e2
        s2 = s1 + k
      end  
      dst.each_with_index{|e, i|src[i] = e}          
    }
    k = 1
    while(k < a.length)
      merge.call(a, [], k)
      k <<= 1
    end
  end
  
  def heap_sort(a)
    parent = lambda{|i| (i - 1) / 2 }
    left = lambda{|i| 2 * i + 1 }
    right = lambda{|i| 2 * i + 2 }
    
    adjust = lambda{|a, i, n|
      k, j = a[i], left.call(i)
      while(j < n)
        if(j < n - 1 && a[j + 1] > a[j])
          j += 1
          #if we want adjust it to minimal root heap, just change condition to a[j + 1] < a[j]
        end
        
        if(k < a[j])
          a[parent.call(j)] = a[j]
          #find max child element and put it to parent node.
          j = left.call(j)
        else
          break
        end
      end
      a[parent.call(j)] = k
    }
    
    n = a.length
    (0..parent.call(n - 1)).reverse_each{|i|
      adjust.call(a, i, n)
    }  
    
    #Big root heap stragegy
    (1...n).reverse_each{|i|
      a[i], a[0] = a[0], a[i]
      adjust.call(a, 0, i);
    }
    
    
    #Small root heap stragegy
#    (1...n).each{|i|
#      adjust.call(++a, 0, n - i)
      #How can us deal with ++pointer in ruby.
#    }    
  end
  
  
end

if __FILE__ == $0
  include Sorting

  begin
    a = [6, 3, 5, 1, 8, 7, 6, 9, 4, 2]
    insert_sort(a)
    p a   
  
    a = [6, 3, 5, 1, 8, 7, 6, 9, 4, 2]
    insert_sort1(a)
    p a    
  
    a = [6, 3, 5, 1, 8, 7, 6, 9, 4, 2]
    bin_insert_sort(a)
    p a
  
    a = [6, 3, 5, 1, 8, 7, 6, 9, 4, 2]
    bubble_sort(a)
    p a
  
    a = [6, 3, 5, 1, 8, 7, 6, 9, 4, 2]
    select_sort(a)
    p a
  
    a = [6, 3, 5, 1, 8, 7, 6, 9, 4, 2]
    merge_sort(a)
    p a
  
    a = [6, 3, 5, 1, 8, 7, 6, 9, 4, 2]
    merge_sort1(a)
    p a
  
  
    a = [6, 3, 5, 1, 8, 7, 6, 9, 4, 2]
    heap_sort(a)
    p a
  
    a = [6, 3, 5, 1, 8, 7, 6, 9, 4, 2]
    quick_sort(a)
    p a
  

  rescue Exception => e
    p e
    p e.backtrace
  end
end


