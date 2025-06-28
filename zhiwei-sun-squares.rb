# This code finds the count of distinct integer solutions to the equation 
# n = a^2 + b^2 + c^2 + d^2 for non-negative integers a, b, c, d.

n = gets.to_i
cmpt = 0
sq = Math.sqrt(n).floor

(0..sq).each do |b|
  (0..sq).each do |c|
    (0..sq).each do |d|
      tmp = n - (b * b + c * c + d * d)
      break if tmp < 0
      a = Math.sqrt(tmp)
      e = Math.sqrt(b + 3 * c + 5 * d)
      cmpt += 1 if a == a.to_i && e == e.to_i
    end
  end
end

puts cmpt