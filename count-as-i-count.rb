# include necessary libraries
require 'set'


shots = Array.new(4, 0)
n = 0
res = 0

n = gets.to_i
gets # to ignore the newline character

while shots[3] < 13
  (0..2).each do |i|
    if shots[i] > 12
      shots[i] = 1
      shots[i + 1] += 1
    end
  end

  if shots.sum == (50 - n)
    ways = 1
    shots.each do |shot|
      ways *= 2 if shot > 1
    end

    res += ways
  end

  shots[0] += 1
end

puts res