input_number = gets.chomp
binary_representation = input_number.to_i(16).to_s(2)
if binary_representation.count('0') % 2 != 0
  input_number = input_number.tr("2345679abcdef", "5##2a#e6d#b9#").reverse
end
if binary_representation.count('1') % 2 != 0
  input_number = input_number.tr("2345679abcdef", "53#2e#a9#c#6#")
end

puts input_number.include?('#') ? 'Not a number' : input_number[0, 1000]