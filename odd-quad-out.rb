sz, odd_quad, odd_value, standard_value, q_row, q_col = 0, 0, 0, 0, 0, 0
sums = Hash.new(0)
cmpts = Hash.new(0)

sz = gets.to_i

(0...sz).each do |i|
  row = gets.chomp
  q_row = (i < sz / 2) ? 0 : 1
  (0...row.size).each do |j|
    q_col = (j < sz / 2) ? 0 : 1
    sums[q_row * 2 + q_col + 1] += row[j].to_i if row[j] != '.'
  end
end

sums.each_value { |v| cmpts[v] += 1 }
sums.each do |k, v|
  if cmpts[v] == 1
    odd_value = v
    odd_quad = k
  else
    standard_value = v
  end
end

puts "Quad-#{odd_quad} is Odd-Quad-Out"
puts "It has value of #{odd_value}"
puts "Others have value of #{standard_value}"