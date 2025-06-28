DIGITS = { 119 => 0, 18 => 1, 93 => 2, 91 => 3, 58 => 4, 107 => 5, 111 => 6, 82 => 7, 127 => 8, 123 => 9 }
CHECKS = { 6 => [1, 3], 5 => [2, 2], 4 => [2, 6], 3 => [3, 3], 2 => [4, 2], 1 => [4, 6], 0 => [5, 3] }

def read_input(digit1, digit2, start_line, inputs, addition = true)
  CHECKS.each do |index, (y, x)|
    if inputs[start_line + y][x] != " "
      digit1[0] |= 1 << index if addition
      digit1[0] &= ~(1 << index) unless addition
    end
    if inputs[start_line + y][x + 8] != " "
      digit2[0] |= 1 << index if addition
      digit2[0] &= ~(1 << index) unless addition
    end
  end
end

inputs = []
23.times do
  inputs << gets.strip
end

digit1 = [0]
digit2 = [0]

read_input(digit1, digit2, 0, inputs)
read_input(digit1, digit2, 8, inputs, false)
read_input(digit1, digit2, 16, inputs)

puts "#{DIGITS[digit1[0]]}#{DIGITS[digit2[0]]}"