N = gets.to_i
x = gets.split.map(&:to_i).sort

cost = 0
while x.length > 1
  minSum = x[0] + x[1]
  cost += minSum
  x = [minSum] + x[2..-1]
  x.sort!
end
puts cost