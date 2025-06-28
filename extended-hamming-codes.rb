data = gets.chomp.split('').map(&:to_i)
check = 0
(1..15).each do |index|
  check ^= index if data[index] != 0
end
data[check] ^= 1 if check != 0
puts data.sum % 2 == 1 ? 'TWO ERRORS' : data.join