module Searching
  
  def bin_search(a, l, r, data)
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
      return -1
    end
  end
  
  def bin_search1(a, l, r, data)
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
    return -1
  end
end