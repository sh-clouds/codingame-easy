op_bowls = gets.chomp.split(' ')
my_bowls = gets.chomp.split(' ')
num = gets.chomp.to_i

grains = my_bowls[num]
combined = my_bowls.concat(op_bowls)
combined[num] = 0

while grains.to_i > 0 do
    num = (num + 1) % 13
    combined[num] = combined[num].to_i + 1
    grains = grains.to_i - 1
end

combined[6] = "[#{combined[6]}]"
combined[13] = "[#{combined[13]}]"

puts combined[7..-1].join(' ')
puts combined[0..6].join(' ')
puts 'REPLAY' if num == 6