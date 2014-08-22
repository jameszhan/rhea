def perm(a, n)
  if n == 0
    p a
  else
    n.times do |i|
      a[n - 1], a[i] = a[i], a[n - 1]
      perm(a, n - 1)
      a[n - 1], a[i] = a[i], a[n - 1]
    end
  end
end

if __FILE__ == $0
  perm([1, 2, 3], 3)
end

