
m, n = gets.split.map { |x| x.to_i }
t = gets.to_i
ret = 2 * (m + n)
d = [0] * (n+2)
d[0] = d[n + 1] = m

inputs = gets.split

0.upto(t-1) do |i|
  col = inputs[i].to_i  
  d[col] += 1
  ret += 2
  ret -= 2 if d[col - 1] >= d[col]
  ret -= 2 if d[col + 1] >= d[col]
  ret -= 2 if d[col] == m
  puts ret
end
